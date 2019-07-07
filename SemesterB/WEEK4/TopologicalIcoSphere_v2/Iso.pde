class Iso{
  
     NodeList vertices = new NodeList();
     PolygonList faces = new PolygonList();
     
     int level = 0;
     
     Iso(PVector[] vertices_){
      
     for(int v = 0; v < vertices_.length; v++){ vertices.add( new Node(vertices_[v].x, vertices_[v].y, vertices_[v].z )); }

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
     
     
     void exportVertices(){
       
          String[] output = new String[vertices.size()];
          
          for(int v = 0; v < vertices.size(); v++){
            
            output[v] = v + ";" + vertices.get(v).x + ";" + vertices.get(v).y + ";" + vertices.get(v);
            
          }
          
          saveStrings("vertices.txt", output);
          
          HashSet<Node> hs = new HashSet<Node>();
          hs.addAll(vertices);
          NodeList newVertices = new NodeList();
          newVertices.addAll(hs);
          
          ArrayList<Aliases> aliases = new ArrayList<Aliases>();
          
          for (int h = 0; h < newVertices.size(); h++) {
          
                Aliases nodeAliases = new Aliases();
                
                for (int v = 0; v < vertices.size(); v++) { 
             
                    if(PVector.dist(newVertices.get(h),vertices.get(v)) < 0.0001) {  nodeAliases.add(v); }
             
                } 
            
                println("node aliases: " + nodeAliases.size());
                aliases.add(nodeAliases);    
            
          }

          println("vertices: " + vertices.size() + " hashed: " + hs.size());
     }
     
     void setNeighbours(){
       
          String s = "";
          
          for(int v = 0; v < vertices.size(); v++){
            
              ArrayList<Integer> tmpNeighbours = new ArrayList<Integer>();
            
              for(int f = 0; f < faces.size(); f++){
               
                  Polygon face = faces.get(f);
                  if(v == face.a) { tmpNeighbours.add(face.b); tmpNeighbours.add(face.c); }
                  if(v == face.b) { tmpNeighbours.add(face.c); tmpNeighbours.add(face.a); }
                  if(v == face.c) { tmpNeighbours.add(face.a); tmpNeighbours.add(face.b); }

              }
              
              //remove duplicates
              HashSet<Integer> hs = new HashSet<Integer>();
              hs.addAll(tmpNeighbours);
              s += hs.size() + ", ";
              vertices.get(v).neighbours.addAll(hs);

          }
          
          println(s);
       
     }
     void nextLevel() {

        double EPSILON = 1e-13;
         
        level+= 16;

        PolygonList faces2 = new PolygonList();
        int index = vertices.size();
 
        for(int f = 0; f < faces.size(); f++) {
          
        Polygon p = faces.get(f);
        
        
        boolean aFound = false;
        boolean bFound = false;
        boolean cFound = false;
        
        int aIndex = -1, bIndex = -1, cIndex = -1;
        int inc = 0;
        
        // replace triangle by 4 triangles
        PVector a = PVector.lerp(vertices.get(p.a), vertices.get(p.b), 0.5);
        PVector b = PVector.lerp(vertices.get(p.b), vertices.get(p.c), 0.5);
        PVector c = PVector.lerp(vertices.get(p.c), vertices.get(p.a), 0.5);
        
        a.normalize();
        b.normalize();
        c.normalize();
        
        
        //if doesn't exist add Node, otherwise excisted index to faces 
        for(int v = 0; v < vertices.size(); v++){
          if(PVector.dist(a, new PVector(vertices.get(v).x, vertices.get(v).y, vertices.get(v).z)) < EPSILON) { aFound = true; aIndex = v;  }
          if(PVector.dist(b, new PVector(vertices.get(v).x, vertices.get(v).y, vertices.get(v).z)) < EPSILON) { bFound = true; bIndex = v;  }
          if(PVector.dist(c, new PVector(vertices.get(v).x, vertices.get(v).y, vertices.get(v).z)) < EPSILON) { cFound = true; cIndex = v; }
        }
        
        if(!aFound) { vertices.add(new Node(a.x, a.y, a.z)); aIndex = index; inc++; }
        if(!bFound) { vertices.add(new Node(b.x, b.y, b.z)); bIndex = index + inc; inc++; }
        if(!cFound) { vertices.add(new Node(c.x, c.y, c.z)); cIndex = index + inc; inc++; }
  
        if(aIndex > -1 && bIndex > -1 && cIndex > -1){
        faces2.add(new Polygon(p.a, aIndex, cIndex, level));
        faces2.add(new Polygon(p.b, bIndex, aIndex, level));
        faces2.add(new Polygon(p.c, cIndex, bIndex, level));
        faces2.add(new Polygon(aIndex, bIndex, cIndex, level));
        }

        //dynamic incremented
        index += inc;
        
        }
        
        faces = faces2;
        
        println(vertices.size());

     }
     
     void draw() {
       
       colorMode(HSB);
       
       for(int f = 0; f < faces.size(); f++){

            stroke(255 - faces.get(f).tint, 0, 240, 255);
            strokeWeight(1);
            fill(faces.get(f).tint, 240, 240, 128);
            beginShape();
            vertex(vertices.get(faces.get(f).a).x * 164, vertices.get(faces.get(f).a).y * 164, vertices.get(faces.get(f).a).z * 164);
            vertex(vertices.get(faces.get(f).b).x * 164, vertices.get(faces.get(f).b).y * 164, vertices.get(faces.get(f).b).z * 164);
            vertex(vertices.get(faces.get(f).c).x * 164, vertices.get(faces.get(f).c).y * 164, vertices.get(faces.get(f).c).z * 164);
            endShape(CLOSE);

       }
       
       Node check = vertices.get(32);
       fill(0);
       stroke(0);
       pushMatrix();
       translate(check.x * 164, check.y * 164, check.z * 164);
       sphere(4);
       popMatrix();
       for(int n = 0; n < check.neighbours.size(); n++){
         
       fill(255, 0, 255);
       stroke(255, 0, 255);
       pushMatrix();
       translate(vertices.get(check.neighbours.get(n)).x * 164, vertices.get(check.neighbours.get(n)).y * 164, vertices.get(check.neighbours.get(n)).z * 164);
       sphere(2.5);
       popMatrix();
       
       }
     }

}

class Aliases extends ArrayList<Integer>{
  
      
  
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


class Node extends PVector{
  
      ArrayList<Integer> neighbours = new ArrayList<Integer>();
  
      Node(float x_, float y_, float z_){ x = x_; y = y_; z = z_; }
  
}

class NodeList extends ArrayList<Node>{
  
  
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
