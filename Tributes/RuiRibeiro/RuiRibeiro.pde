/*

Rui Ribeiro Tribute

 HashMap<String, Integer> map = new HashMap<String, Integer>();
 
 map.put("a", 4);
 map.put("c", 6);
 map.put("b", 2);
 
 Object[] a = map.entrySet().toArray();
 Arrays.sort(a, new Comparator() {
 public int compare(Object o1, Object o2) {
 return ((Map.Entry<String, Integer>) o2).getValue().compareTo(
 ((Map.Entry<String, Integer>) o1).getValue());
 }
 });
 for (Object e : a) {
 System.out.println(((Map.Entry<String, Integer>) e).getKey() + " : "
 + ((Map.Entry<String, Integer>) e).getValue());
 }
 
 
 List<Integer> intList = new ArrayList<Integer>(map.values());
 
 Collections.sort(intList, new Comparator<Integer>() {
 
 public int compare(Integer o1, Integer o2) {
 // for descending order
 return o2 - o1;
 }
 });
 
 @author Vladimir V. KUCHINOV
 @email helloworld@vkuchinov.co.uk
 
 */

import java.util.Random;
import java.util.Collections;
import java.util.*;

import processing.pdf.*;

Random randSeed = new Random(2345678);
Patch test;

ArrayList<PVector> points = new ArrayList();
PVector top = new PVector(400, 25);
PVector bottom = new PVector(400, 725);
int stitch = 128;

ArrayList<PVector> middles = new ArrayList();

void setup() {

  size(800, 800, "processing.core.PGraphicsRetina2D");

  background(255);

  beginRecord(PDF, "output.pdf");
  
  for (int p = 0; p < 4; p++) {

    float randX = random(150, 380);
    float randY = random(300, 480);
    points.add(new PVector(randX, randY));
  }
  
    points.add(new PVector(400, 400));
  
  for (int p = 4; p > 0 ; p--) {

    PVector symmetry = points.get(p - 1);
    points.add(new PVector(800 - symmetry.x,symmetry.y));
  }
  

   Collections.sort(points, new CompareX());
   
   for(int p = 0; p < points.size(); p++){
     middles.add(points.get(p)); 
   }
   
   PVector end = new PVector(points.get(8).x, points.get(8).y + 30);
   end.lerp(new PVector(points.get(7).x, points.get(7).y + 30 ), 0.5);
   
   middles.add(end);
   
   for(int p = points.size() - 1; p > 1; p--){
     middles.add(new PVector(points.get(p - 1).x,points.get(p - 1).y + 30)); 
   }
   
   PVector start = new PVector(points.get(0).x, points.get(0).y + 30);
   start.lerp(new PVector(points.get(1).x, points.get(1).y + 30 ), 0.5);
   
   middles.add(start);
   
   fill(0);
   beginShape();
   for(int m = 0; m < middles.size(); m++){
     vertex(middles.get(m).x, middles.get(m).y);
   }
   endShape();
  
   for (int p = 0; p < points.size(); p++) {

    if(p < points.size() - 1){
      
    noFill();
    strokeWeight(1.5);
    
    PVector prev = points.get(p);
    PVector next = points.get(p + 1);
    line(prev.x, prev.y, next.x, next.y);
    line(top.x, top.y, prev.x, prev.y);
    
    line(prev.x, prev.y + 30, next.x, next.y +30);
    line(bottom.x, bottom.y, prev.x, prev.y + 30);
    
    
      for(int l = 0; l < stitch; l++){
       
       strokeWeight(0.5);
       PVector l1 = new PVector(prev.x, prev.y);
       l1.lerp(top, (1.0/stitch)*l);
       PVector l2 = new PVector(next.x, next.y);
       l2.lerp(top, (1.0/stitch)*l);
       line(l1.x, l1.y, l2.x, l2.y);
       
       l1 = new PVector(prev.x, prev.y + 30);
       l1.lerp(bottom, (1.0/stitch)*l);
       l2 = new PVector(next.x, next.y + 30);
       l2.lerp(bottom, (1.0/stitch)*l);
       line(l1.x, l1.y, l2.x, l2.y);
       
      }
    
    
    }
    else{
      
    strokeWeight(1.5);
    PVector prev = points.get(p);
    line(top.x, top.y, prev.x, prev.y);
    line(bottom.x, bottom.y, prev.x, prev.y + 30);
    }
    
  }
  
  endRecord();
  
}

class CompareX implements Comparator<PVector>
{

  int compare(PVector v1, PVector v2)
  {
    return int(v1.x - v2.x);
  }
}

