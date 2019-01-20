class LDictionary{
  
    //bespoke push/pop matrices
    ArrayList<Carriage> matrices = new ArrayList<Carriage>();
    
    LDictionary(){
      
    }
    
    //angle as z-axis
    PVector process(Carriage carriage_, char case_){
      
        switch(case_){
          
        case 'A':
        float newAX = carriage_.x + cos(radians(carriage_.z)) * carriage_.len;
        float newAY = carriage_.y + sin(radians(carriage_.z)) * carriage_.len;
        carriage_.x = newAX; carriage_.y = newAY;
        break;
        
        case 'B':
        float newBX = carriage_.x + cos(radians(carriage_.z)) * carriage_.len;
        float newBY = carriage_.y + sin(radians(carriage_.z)) * carriage_.len;
        carriage_.x = newBX; carriage_.y = newBY;
        break;
        
        case 'F':
        float newX = carriage_.x + cos(radians(carriage_.z)) * carriage_.len;
        float newY = carriage_.y + sin(radians(carriage_.z)) * carriage_.len;
        carriage_.x = newX; carriage_.y = newY;
        break;
        
        case 'X':
        break;
        
        case 'S':
        carriage_.len *= carriage_.ratio;
        break;
        
        case '[':
        matrices.add(new Carriage(carriage_));
        //carriage_.z += carriage_.angle;
        break;
        
        case ']':
        carriage_.x = matrices.get(matrices.size() - 1).x;
        carriage_.y = matrices.get(matrices.size() - 1).y;
        carriage_.z = matrices.get(matrices.size() - 1).z;
        carriage_.len = matrices.get(matrices.size() - 1).len;
        matrices.remove(matrices.size() - 1);
        //carriage_.z -= carriage_.angle;
        break;
        
        case '+':
        carriage_.z += carriage_.angle;
        break;
        
        case '-':
        carriage_.z -= carriage_.angle;
        break;
        
        default:
        break;
          
        }
        
        return carriage_;
        
    }
    
}
