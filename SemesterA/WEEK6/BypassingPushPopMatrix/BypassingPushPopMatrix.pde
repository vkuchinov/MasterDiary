/*

REPLACING PUSH/POP MATRICES
a short exercise to understand push/pop methods and
way to do it by myself. Just for better understanding.

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/

//rotation angle @ z-axis
ArrayList<PVector> myPushPop = new ArrayList<PVector>();

void setup(){
    
    size(600, 600);
    translate(width/2, height/2);
    
    //    //PUSH/POP MATRICES & SUB-MATRICES
    //    
    //    pushMatrix(); //save current state
    //    
    //    stroke(255, 0, 0);
    //    strokeWeight(8.0);
    //    point(0, 0); // state 0 point;
    //    
    //        pushMatrix(); //save second state
    //        translate(0, -100.0);
    //        
    //        stroke(0, 0, 255);
    //        strokeWeight(8.0);
    //        point(0, 0); // state 0 point;
    //        
    //        popMatrix(); //restore second state
    //    
    //    popMatrix(); //restore current state;
    
    
    //BYPASSING BUILT-IN METHODS
    
    PVector currentLocation = new PVector(0, 0);
    
    //saving first state
    myPushPop.add(new PVector(0, 0, 0));
    
    //saving second state
    myPushPop.add(new PVector(0, - 100.0, 0));
    
    //this equals to rotation()
    myPushPop.get(myPushPop.size() - 1).x = myPushPop.get(myPushPop.size() - 1).x + cos(radians(45)) * myPushPop.get(myPushPop.size() - 1).dist(myPushPop.get(myPushPop.size() - 2));
    myPushPop.get(myPushPop.size() - 1).y = myPushPop.get(myPushPop.size() - 1).x + sin(radians(45)) * myPushPop.get(myPushPop.size() - 1).dist(myPushPop.get(myPushPop.size() - 2));
    
    //third location
    stroke(0, 255, 0);
    strokeWeight(8.0);
    point( myPushPop.get(myPushPop.size() - 1).x + 50, myPushPop.get(myPushPop.size() - 1).y - 60);
    
    
    //restoring second state [read last element and then removes it]
    currentLocation = myPushPop.get(myPushPop.size() - 1);
    myPushPop.remove(myPushPop.size() - 1);
    
    stroke(255, 0, 0);
    strokeWeight(8.0);
    point(currentLocation.x, currentLocation.y);
    
    //resotring first state
    currentLocation = myPushPop.get(myPushPop.size() - 1);
    myPushPop.remove(myPushPop.size() - 1);
    
    stroke(0, 0, 255);
    strokeWeight(8.0);
    point(currentLocation.x, currentLocation.y);
  
}
