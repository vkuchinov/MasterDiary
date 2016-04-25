class Polygon {

  ArrayList<PVector> vertices;
  PVector centroid;

  Polygon() {

      vertices = new ArrayList<PVector>();
      centroid = new PVector();
      
  }

  void clear() {
    
      vertices.clear();
      
  }

  void addVertex(PVector newVertex) {
    
      vertices.add(newVertex);
      updateCentroid();
      sortVertices();
    
  }


  void updateCentroid() {
    
      centroid = new PVector();
      
      for (PVector v : vertices) {
          centroid.add(v);
      } 
      
      centroid.div(vertices.size());
      
  }

  void sortVertices() {

        ArrayList<PVector> newVertices = new ArrayList<PVector>();
        
        while (!vertices.isEmpty()) {
        
            float biggestAngle = 0;
            PVector biggestVertex = null;
            
            for (PVector v : vertices) {
              
                PVector dir = PVector.sub(v, centroid);
                float a = dir.heading2D() + PI;
                    if (a > biggestAngle) {
                      
                        biggestAngle = a;
                        biggestVertex = v;
                        
                    }
                    
            }
            
            newVertices.add(biggestVertex);
            vertices.remove(biggestVertex);
            
        }
        
        vertices = newVertices;
        
  }

  void displayOffsets(float[] offsets_) {

    for(int o = 0; o < offsets_.length; o++){
      
        colorMode(HSB);
        noFill();
        stroke(map(offsets_[o], 0, 1.0, 0, 255), 240, 240);
        
        beginShape();
            for (PVector v : vertices) {
             
                PVector offsetPoint = PVector.lerp(v, centroid, offsets_[o]);
                vertex(offsetPoint.x, offsetPoint.y);
              
            } 
            
        endShape(CLOSE);
        
        }
        
  }
  
}

