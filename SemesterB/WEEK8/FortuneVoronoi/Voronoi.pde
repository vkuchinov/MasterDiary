class Voronoi{
  
      CellList cells = new CellList();
      
      Voronoi(){
    
      }    
      
      void addCell(){
        
      }

}

class Cell{
  
      int id;
      
      boolean valid = false;
      ArrayList<PVector> edges = new ArrayList<PVector>();
      
      Cell(){
       
      } 
  
}

class CellList extends ArrayList<Cell>{
  
  
}
