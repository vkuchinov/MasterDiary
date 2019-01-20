class Cone{
 
      PVector center;
      float radius, peak;
      
      Cone(PVector center_, float radius_, float peak_) {
        
           center = new PVector(center_.x, center_.y, center_.z);
           radius = radius_;
           peak = peak_;
        
      }
      
      PVector randomPointWithinCone(){
        
           return new PVector(0.0, 0.0, 0.0);
        
      }
      
      PVector randomPointOnConeSurface(){
        
          return new PVector(0.0, 0.0, 0.0);
        
      }
  
}
