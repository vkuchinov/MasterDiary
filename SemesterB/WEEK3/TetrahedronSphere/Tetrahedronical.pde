class Tetrahedronical{
 
     PVectorList vertices = new PVectorList();
     PolygonList polygons = new PolygonList();
     int level = 0;
     int index = 0;
     
     int subdivisions;
     
     
     Tetrahedronical(PVector[] vertices_, int subdivisions_){
      
           subdivisions = subdivisions_;
           
           for(int v = 0; v < vertices_.length; v++){
           //vertices.add(vertices_[v]);  
           }
           
           //initial polygons
           PVector[] initialPolygons = {new PVector(0, 1, 2), new PVector(1, 2, 3), new PVector(2, 3, 0), new PVector(3, 0, 1)};
           
           for(int f = 0; f < initialPolygons.length; f++){
            
           //polygons.add(new Polygon(int(initialPolygons[f].x), int(initialPolygons[f].y), int(initialPolygons[f].z), 0));
             
           }
           
           dividePolygon(vertices_[0], vertices_[1], vertices_[2], subdivisions);
           dividePolygon(vertices_[3], vertices_[2], vertices_[1], subdivisions);
           dividePolygon(vertices_[0], vertices_[3], vertices_[1], subdivisions);
           dividePolygon(vertices_[0], vertices_[2], vertices_[3], subdivisions);
            
 
     } 
     
     void createPolygon(PVector a_, PVector b_, PVector c_) {
            
            vertices.add(a_);
            vertices.add(b_);      
            vertices.add(c_);

            Polygon poly = new Polygon(index, index + 1, index + 2, level);
            polygons.add(poly);

            index += 3;
            
     }
     
     void dividePolygon(PVector a_, PVector b_, PVector c_, int count_) {
        
        if ( count_ > 0 ) {
        
            PVector ab = PVector.lerp( a_, b_, 0.5);
            PVector ac = PVector.lerp( a_, c_, 0.5);
            PVector bc = PVector.lerp( b_, c_, 0.5);
           
            ab.normalize();
            ac.normalize();
            bc.normalize();

            //ab = normalize(ab, true);
            //ac = normalize(ac, true);
            //bc = normalize(bc, true);

            //recursion
            dividePolygon( a_, ab, ac, count_ - 1 );
            dividePolygon( ab, b_, bc, count_ - 1 );
            dividePolygon( bc, c_, ac, count_ - 1 );
            dividePolygon( ab, bc, ac, count_ - 1 );
            level += 8;
            
            }  else { createPolygon( a_, b_, c_ ); }
            
        }
        
     PVector mix(PVector u_, PVector v_, float s_){

       if ( u_.mag() != v_.mag() ) { println( "vector dimension mismatch" ); return null; }

          println(u_.mag());
          //for ( float i = 0; i < u.mag(); i++ ) {
          //    result.push( (1.0 - s_) * u[i] + s * v[i] );
          //}
      
          //return result;
          //}
    
     return null;

     }
        
     void draw(){
       
       colorMode(HSB);
         
         for(int p = 0; p < polygons.size(); p++){
           
            fill(polygons.get(p).tint, 240,240, 128);
            
            beginShape();
            vertex(vertices.get(polygons.get(p).a).x * 120, vertices.get(polygons.get(p).a).y  * 120, vertices.get(polygons.get(p).a).z  * 120);
            vertex(vertices.get(polygons.get(p).b).x * 120, vertices.get(polygons.get(p).b).y * 120, vertices.get(polygons.get(p).b).z * 120);
            vertex(vertices.get(polygons.get(p).c).x * 120, vertices.get(polygons.get(p).c).y * 120, vertices.get(polygons.get(p).c).z * 120);
            endShape(CLOSE);
           
         }
       
     }
  
}

class PVectorList extends ArrayList<PVector>{
  
      
  
}

class Polygon{
 
     int a, b, c;
     int tint;
     
     Polygon(int a_, int b_, int c_, int tint_){  a = a_; b = b_; c = c_; tint = tint_; } 
  
}

class PolygonList extends ArrayList<Polygon>{
  
  
  
}
