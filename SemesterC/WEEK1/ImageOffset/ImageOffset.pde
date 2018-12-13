/*

IMAGE OFFSET

@author Vladimir V KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

PImage src, dest;

void setup(){
  
    src = loadImage("landscape.jpg");
    dest = createImage(src.width, src.height, RGB);
    size(src.width, src.height);
    
    offset(128);
    
    image(dest, 0, 0);
  
}

void offset(int v_){
  
    for(int y = 0; y < src.height; y++){
      for(int x = 0; x < src.width; x++){
        
          color c = src.get(x, y);
          
          int nx = (v_ + x) % src.width;
          int ny = (v_ + y) % src.height;
          
          dest.set(nx, ny, c);
       
      }
    }

}

void offset2(int v_){
  
    for(int i = 0; i < src.pixels.length; i++){
      
      
    }

}
