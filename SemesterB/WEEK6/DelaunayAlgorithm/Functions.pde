void Delaunay(){
  
  faces.clear();
  if(points.size() < 6) return;
  
  faces.add(new Face(points.get(0), points.get(1), points.get(2)));
  
  for(int i = 3; i < points.size(); i++){
    PVector point = points.get(i);
    Face f = null;

    for(int j = 0; j < faces.size(); ++j){
        f = faces.get(j);
        if(f.inTriangle(point))
        break;
      }
    
    if(true){

      faces.remove(f);
  
      Face f1 = new Face(point, f.edges[0], f.edges[1]);
      Face f2 = new Face(point, f.edges[1], f.edges[2]);
      Face f3 = new Face(point, f.edges[2], f.edges[0]);
      
      faces.add(f1);
      faces.add(f2);
      faces.add(f3);
  
      validEdge(f1, point);
      validEdge(f2, point);
      validEdge(f3, point);
    }
  }
}

void drawTriangulation(){

ArrayList<PVector> l1 = new ArrayList<PVector>(points.subList(0,3));

  stroke(0);
  fill(200);
  for(int j = 0; j < faces.size(); ++j){
    Face f = faces.get(j);
    ArrayList<PVector> l2 = new ArrayList<PVector>(Arrays.asList(f.edges));
    l2.retainAll(l1);
    
    if(l2.size() == 0)
    f.draw();
  }

}

void validEdge(Face face_, PVector point_){
  
  Face fadj = face_.getAdjacent(point_);
  
  if(fadj == null) return;
  
  if(fadj.inCircle(point_))
  {
    fadj.flip(face_);
    validEdge(face_, point_);
    validEdge(fadj, point_);
  }
}
