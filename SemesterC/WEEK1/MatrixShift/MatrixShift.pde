/*

MATRIX SHIFT

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

int dims = 256;
PVector[][] values = new PVector[dims][dims];
int[] indices = new int[dims];
PImage src;

void setup(){
  
    src = loadImage("cat.jpg");
    size(src.width, src.height);
    
    for(int y = 0; y < dims; y++){
      
      indices[y] = y;
      
      for(int x = 0; x < dims; x++){

         values[x][y] = new PVector(x, y);
        
      }
    }

    //for(int i = 0; i < 32; i++){ shift(); }
    
    
    

    
}

void draw(){
  
  if(frameCount % 24 == 0){
  shift();
  render();
  }
  
}

void setValues(){
  
 for(int y = 0; y < dims; y++){

      for(int x = 0; x < dims; x++){

         values[x][y] = new PVector(x, y);
        
      }
    }
 
  
}

void render(){
  
   for(int y = 0; y < dims; y++){
      for(int x = 0; x < dims; x++){
        
         int nx = (int)values[x][y].x;
         int ny = (int)values[x][y].y;
         set(x, y, src.get(nx, ny));
        
      }
   }

}

void display(PVector[][] values_){
  
  for(int y = 0; y < dims; y++){
      
      String l = "";
      
      for(int x = 0; x < dims; x++){
        
         l += values[x][y] + " ";
        
      }
      
      println(l);
      println();
      
    }
  
}

public void shift() {

        setValues();
        
        int first = indices[0];
        for( int i = 0; i < indices.length - 1 ; i++ ) { indices[i] = indices[i + 1]; }
        indices[indices.length - 1] = first;

        PVector[][] tmp = new PVector[dims][dims];
        
        for(int y = 0; y < dims; y++){
          for(int x = 0; x < dims; x++){
            
          tmp[x][y] = new PVector(0, 0);
          tmp[x][y].x = values[indices[x]][indices[y]].x;
          tmp[x][y].y = values[indices[x]][indices[y]].y;
        
          }
        }
        
        values = tmp;

}

