class Iso{
  
     PVectorList vertices = new PVectorList();
     PolygonList faces = new PolygonList();
     
     int level = 0;
     
     Iso(PVector[] vertices_){
      
     for(int v = 0; v < vertices_.length; v++){ vertices.add( new PVector(vertices_[v].x, vertices_[v].y, vertices_[v].z )); }

           faces.add(new Polygon(0, 11, 5, 0));
           faces.add(new Polygon(0, 5, 1, 0));
           faces.add(new Polygon(0, 1, 7, 0));
           faces.add(new Polygon(0, 7, 10, 0));
           faces.add(new Polygon(0, 10, 11, 0));
           
           faces.add(new Polygon(1, 5, 9, 0));
           faces.add(new Polygon(5, 11, 4, 0));
           faces.add(new Polygon(11, 10, 2, 0));
           faces.add(new Polygon(10, 7, 6, 0));
           faces.add(new Polygon(7, 1, 8, 0));
           
           faces.add(new Polygon(3, 9, 4, 0));
           faces.add(new Polygon(3, 4, 2, 0));
           faces.add(new Polygon(3, 2, 6, 0));
           faces.add(new Polygon(3, 6, 8, 0));
           faces.add(new Polygon(3, 8, 9, 0));
      
           faces.add(new Polygon(4, 9, 5, 0));
           faces.add(new Polygon(2, 4, 11, 0));
           faces.add(new Polygon(6, 2, 10, 0));
           faces.add(new Polygon(8, 6, 7, 0));
           faces.add(new Polygon(9, 8, 1, 0));
           

     } 
     
     
     void nextLevel() {
       
        println("faces: " + faces.size());
        if(level < 16) {
        level = 17;
        PolygonList faces2 = new PolygonList();
        int index = vertices.size();
 
        for(int f = 0; f < faces.size(); f++) {
          
        Polygon p = faces.get(f);
        
        // replace triangle by 4 triangles
        PVector a = PVector.lerp(vertices.get(p.a), vertices.get(p.b), 0.5);
        PVector b = PVector.lerp(vertices.get(p.b), vertices.get(p.c), 0.5);
        PVector c = PVector.lerp(vertices.get(p.c), vertices.get(p.a), 0.5);

        vertices.add(a);
        vertices.add(b);
        vertices.add(c);
        
        faces2.add(new Polygon(p.a, index, index + 2, level));
        faces2.add(new Polygon(p.b, index + 1, index, level));
        faces2.add(new Polygon(p.c, index + 2, index + 1, level));
        faces2.add(new Polygon(index, index + 1, index + 2, level));

        }
        
        println("faces2: " + faces.size());
         
        faces.clear();
        faces =faces2;
     
        }
     }
     
     void draw(int tint_) {
       
       colorMode(HSB);
       
       for(int f = 0; f < faces.size(); f++){
        
            strokeWeight(4.0);
            stroke(tint_, 240, 240);
            fill(faces.get(f).tint, 240, 240, 92);
            //beginShape();
            point(vertices.get(faces.get(f).a).x * 64, vertices.get(faces.get(f).a).y * 64, vertices.get(faces.get(f).a).z * 64);
            point(vertices.get(faces.get(f).b).x * 64, vertices.get(faces.get(f).b).y * 64, vertices.get(faces.get(f).b).z * 64);
            point(vertices.get(faces.get(f).c).x * 64, vertices.get(faces.get(f).c).y * 64, vertices.get(faces.get(f).c).z * 64);
            //endShape(CLOSE);
         
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
