class Iso{
  
     PVectorList vertices = new PVectorList();
     PolygonList faces = new PolygonList();
     TriangleList triangles = new TriangleList();
     
     int level = 0;
     
     Iso(PVector[] vertices_){
      
     for(int v = 0; v < vertices_.length; v++){ vertices.add( new PVector(vertices_[v].x, vertices_[v].y, vertices_[v].z )); }

//           faces.add(new Polygon(0, 11, 5, 0));
//           faces.add(new Polygon(0, 5, 1, 0));
//           faces.add(new Polygon(0, 1, 7, 0));
//           faces.add(new Polygon(0, 7, 10, 0));
//           faces.add(new Polygon(0, 10, 11, 0));
//           
//           faces.add(new Polygon(1, 5, 9, 0));
//           faces.add(new Polygon(5, 11, 4, 0));
//           faces.add(new Polygon(11, 10, 2, 0));
//           faces.add(new Polygon(10, 7, 6, 0));
//           faces.add(new Polygon(7, 1, 8, 0));
//           
//           faces.add(new Polygon(3, 9, 4, 0));
//           faces.add(new Polygon(3, 4, 2, 0));
//           faces.add(new Polygon(3, 2, 6, 0));
//           faces.add(new Polygon(3, 6, 8, 0));
//           faces.add(new Polygon(3, 8, 9, 0));
//      
//           faces.add(new Polygon(4, 9, 5, 0));
//           faces.add(new Polygon(2, 4, 11, 0));
//           faces.add(new Polygon(6, 2, 10, 0));
//           faces.add(new Polygon(8, 6, 7, 0));
//           faces.add(new Polygon(9, 8, 1, 0));

           triangles.add(new Triangle(vertices_[0], vertices_[11], vertices_[5], 0));
           triangles.add(new Triangle(vertices_[0], vertices_[5], vertices_[1], 0));
           triangles.add(new Triangle(vertices_[0], vertices_[1], vertices_[7], 0));
           triangles.add(new Triangle(vertices_[0], vertices_[7], vertices_[10], 0));
           triangles.add(new Triangle(vertices_[0], vertices_[10], vertices_[11],  0));
           
           triangles.add(new Triangle(vertices_[1], vertices_[5], vertices_[9], 0));
           triangles.add(new Triangle(vertices_[5], vertices_[11], vertices_[4], 0));
           triangles.add(new Triangle(vertices_[11], vertices_[10], vertices_[2], 0));
           triangles.add(new Triangle(vertices_[10], vertices_[7], vertices_[6],  0));
           triangles.add(new Triangle(vertices_[7], vertices_[1], vertices_[8], 0));
           
           triangles.add(new Triangle(vertices_[3], vertices_[9], vertices_[4],  0));
           triangles.add(new Triangle(vertices_[3], vertices_[4], vertices_[2], 0));
           triangles.add(new Triangle(vertices_[3], vertices_[2], vertices_[6], 0));
           triangles.add(new Triangle(vertices_[3], vertices_[6], vertices_[8], 0));
           triangles.add(new Triangle(vertices_[3], vertices_[8], vertices_[9],  0));
      
           triangles.add(new Triangle(vertices_[4], vertices_[9], vertices_[5],  0));
           triangles.add(new Triangle(vertices_[2], vertices_[4], vertices_[11],  0));
           triangles.add(new Triangle(vertices_[6], vertices_[2], vertices_[10],  0));
           triangles.add(new Triangle(vertices_[8], vertices_[6], vertices_[7], 0));
           triangles.add(new Triangle(vertices_[9], vertices_[8], vertices_[1],  0));
           

     } 
     
     
     void nextLevel() {
       
        println("faces: " + faces.size());
        if(level < 49) {
        level+= 16;
        TriangleList triangles2 = new TriangleList();
        PolygonList faces2 = new PolygonList();
        int index = vertices.size();
 
        for(int f = 0; f < triangles.size(); f++) {
          
        Triangle p = triangles.get(f);
        
        // replace triangle by 4 triangles
        PVector a = PVector.lerp(p.a, p.b, 0.5);
        PVector b = PVector.lerp(p.b, p.c, 0.5);
        PVector c = PVector.lerp(p.c, p.a, 0.5);
        
        a.normalize();
        b.normalize();
        c.normalize();
        
        triangles2.add(new Triangle(p.a, a, c, level));
        triangles2.add(new Triangle(p.b, b, a, level));
        triangles2.add(new Triangle(p.c, c, b, level));
        triangles2.add(new Triangle(a, b, c, level));

        }
        
        println("faces2: " + faces.size());
        triangles.clear();
        triangles = triangles2;
     
        }
     }
     
     void draw(int tint_) {
       
       colorMode(HSB);
       
       for(int f = 0; f < triangles.size(); f++){
        
            //strokeWeight(4.0);
            stroke(tint_, 240, 240);
            fill(triangles.get(f).tint, 240, 240, 92);
            beginShape();
            vertex(triangles.get(f).a.x * 64, triangles.get(f).a.y * 64, triangles.get(f).a.z * 64);
            vertex(triangles.get(f).b.x * 64, triangles.get(f).b.y * 64, triangles.get(f).b.z * 64);
            vertex(triangles.get(f).c.x * 64, triangles.get(f).c.y * 64, triangles.get(f).c.z * 64);
            endShape(CLOSE);
         
       }
       
     }

}

class PVectorList extends ArrayList<PVector>{
  
      
  
}

class Polygon{
 
     int a, b, c;
     int tint;
     
     Polygon( int a_, int b_, int c_, int tint_ ) { 
     
         a = a_;
         b = b_;
         c = c_;
         tint = tint_;
     }
  
}

class PolygonList extends ArrayList<Polygon>{
  
  
  
}



class Triangle{
 
     PVector a, b, c;
     int tint;
     
     Triangle( PVector a_, PVector b_, PVector c_, int tint_ ) { 
     
         a = new PVector(a_.x, a_.y, a_.z);
         b = new PVector(b_.x, b_.y, b_.z);
         c = new PVector(c_.x, c_.y, c_.z);
         
         tint = tint_;
     }
  
}

class TriangleList extends ArrayList<Triangle>{
  
  
  
}
