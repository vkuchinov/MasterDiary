ArrayList<OSC> types = new ArrayList<OSC>();

class Oscillator{
  

   Oscillator(String id_){

       types.add(new OSC("pinwheel", new int[12][12], 4));
     
   } 
  
}

class OSC{
    
   String id;
   int[][] set;
   int period, w, h;
   
   OSC(String id_, int[][] set_, int period_){
     
       id = id_;
       set = set_;
       period = period;
 
   }

}
