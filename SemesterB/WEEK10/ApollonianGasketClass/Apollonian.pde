class Apollonian{
  
     PVector origin;
     String symmetry;
     int[] parameters;
     
     int maxLevels, level;
     
     //first four circles
     Circle[] circles = new Circle[4];
     
     Apollonian(PVector origin_, int levels_, String symmetry_, int param1_, int param2_, int param3_, int param4_){
      
           origin = new PVector(origin_.x, origin_.y);
           level = levels_;
           maxLevels = levels_;
           
           symmetry = symmetry;
           parameters = new int[]{param1_, param2_, param3_, param4_};
          
           
     } 
     
     void build(){
       
         if(level == maxLevels){
           
             noFill();
             stroke(255);
             strokeWeight(1.0);
             
             arrayCopy(initialCirlces(150.0, 150.0, 150.0 + 70 * sin(-0.01)), 0, circles, 1, 3);
             circles[0] = outerCircle(circles[1], circles[2], circles[3]);
      
             for(int c = 0; c < circles.length; c++){
                circles[c].draw(color(255));
             }

             Circle result = secondSolution(circles[0], circles[1], circles[2], circles[3]);
             result.draw(color(255));
             Circle result2 = secondSolution(circles[1], circles[0], circles[2], circles[3]);
             result2.draw(color(255));
             Circle result3 = secondSolution(circles[2], circles[0], circles[1], circles[3]);
             result3.draw(color(255));
             Circle result4 = secondSolution(circles[3], circles[0], circles[1], circles[2]);
             result4.draw(color(255));
        
             build(result, circles[1], circles[2], circles[3], level - 1);
             build(result2, circles[0], circles[2], circles[3], level - 1);
             build(result3, circles[0], circles[1], circles[3], level - 1);
             build(result4, circles[0], circles[1], circles[2], level - 1);
         
         } 
 
     }
     
     void build(Circle c1_, Circle c2_, Circle c3_, Circle c4_, int level_){
       
            if(level_ > 0){
             
                Circle result2 = secondSolution(c2_, c1_, c3_, c4_);
                result2.draw(color(255));
                Circle result3 = secondSolution(c3_, c1_, c2_, c4_);
                result3.draw(color(255));
                Circle result4 = secondSolution(c4_, c1_, c2_, c3_);
                result4.draw(color(255));
            
                build(result2, c1_, c3_, c4_, level_ - 1);
                build(result3, c1_, c2_, c4_, level_ - 1);
                build(result4, c1_, c2_, c3_, level_ - 1);
                
            }
       
     }
     
     double[] Descartes(float a_, float b_, float c_){
       
         return new double[]{ (a_ + b_ + c_ + 2 * (Math.sqrt(a_ * b_ + b_ * c_ + c_ * a_ ))), (a_ + b_ + c_ - 2 * (Math.sqrt (a_ * b_ + b_ * c_ + c_ * a_)))};
       
     }
     
     Circle[] initialCirlces(float radius1_, float radius2_, float radius3_) {
       
        Circle[] outputs = new Circle[3];
        Circle c0, c1, c2;
        float posx, posy;
      
        c0 = new Circle(radius1_, new PVector(width/3, height/2.5));
        outputs[0] = c0;
      
        c1 = new Circle( radius2_, new PVector(width/3 + radius1_ + radius2_, height/2.5));
        outputs[1] = c1;
      
        posx =  (pow(radius1_, 2) + radius1_ * radius3_ + radius1_ * radius2_ - radius2_ * radius3_) / (radius1_ + radius3_);
        posy =  sqrt((radius1_ + radius3_) * (radius1_ + radius3_) - posx*posx );
      
        c2 = new Circle(radius3_, new PVector(width/3 + posx, height/2.5 + posy));
        outputs[2] = c2;
      
        return outputs;
        
     }

     Circle outerCircle(Circle c1_, Circle c2_, Circle c3_){
  
        float c1C, c2C, c3C, c4C, c4radius; 
        //set of complex numbers for calculation
        Complex z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11;
      
        //curvatures, shorten variable name
        c1C = c1_.curvature();
        c2C = c2_.curvature();
        c3C = c3_.curvature();
      
        c4C = c1C + c2C + c3C - 2 * (sqrt((c1C * c2C) + (c2C * c3C ) + (c1C * c3C)));
        c4radius = 1.0 / c4C; 
      
        z1 = new Complex(c1_.location.x, c1_.location.y);
        z2 = new Complex(c2_.location.x, c2_.location.y);
        z3 = new Complex(c3_.location.x, c3_.location.y);
      
        //z4 = z1 * c1C + z2 * c2C + z3 * c3C
        z4 =  z1.times(c1C).plus(z2.times(c2C)).plus(z3.times(c3C));
        //z5 = z1 * z2 * c1C * c2C
        z5 =  z1.times(z2).times(c1C * c2C);
      
        //z6 = z2 * z3 * c2C * c3C
        z6 =  z2.times(z3).times(c2C * c3C);
        //z7 = z1 * z3 * c1C * c3C
        z7 =  z1.times(z3).times(c1C * c3C);
      
        //z8 = z5 + z6 + z7;
        z8 = z5.plus(z6).plus(z7);
        //z9 = sqrt(z8) * -2
        z9 = z8.sqrt().times(-2);  
      
        //z10 = z4 + z9;
        z10 = z4.plus(z9);
        //z11 = z10 / c4C
        z11 = z10.divides(c4C);
      
        return new Circle(c4radius, new PVector((float)z11.re(), (float)z11.im()));
        
}
  
    Circle secondSolution(Circle c0_, Circle c1_, Circle c2_, Circle c3_) {
      
        float c0C, c1C, c2C, c3C, cNew;
        Complex z0, z1, z2, z3, z4, z5, z6, z7, zNew;
      
        c0C = c0_.curvature();
        c1C = c1_.curvature();
        c2C = c2_.curvature();
        c3C = c3_.curvature();
      
        z0 = new Complex(c0_.location.x, c0_.location.y);
        z1 = new Complex(c1_.location.x, c1_.location.y);
        z2 = new Complex(c2_.location.x, c2_.location.y);
        z3 = new Complex(c3_.location.x, c3_.location.y);
       
       
        cNew = (2.0 * (c1C + c2C + c3C)) - c0C;
      
        //z4 = z1 * C1C + z2 * c2C + z3 * c3C
        z4 = z1.times(c1C).plus(z2.times(c2C)).plus(z3.times(c3C));
        z5 = z4.times(2.0);
        z6 = z0.times(c0C);
        z7 = z5.minus(z6);
        zNew = z7.divides(cNew);
      
        return new Circle(1.0 / cNew, new PVector((float)zNew.re(), (float)zNew.im()));
      
    }

}
