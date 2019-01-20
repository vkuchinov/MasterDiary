class LDictionary{
  
    //bespoke push/pop matrices
    ArrayList<Carriage> matrices = new ArrayList<Carriage>();
    
    LDictionary(){
      
    }
    
    //angle as z-axis
    PVector process(Carriage carriage_, char case_){
      
        switch(case_){
          
        case 'A':
        carriage_.last = new PVector(carriage_.x, carriage_.y);
        float newAX = carriage_.x + cos(radians(carriage_.z)) * carriage_.len;
        float newAY = carriage_.y + sin(radians(carriage_.z)) * carriage_.len;
        carriage_.x = newAX; carriage_.y = newAY;
        break;
        
        case 'B':
        carriage_.last = new PVector(carriage_.x, carriage_.y);
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
        carriage_.last = new PVector(matrices.get(matrices.size() - 1).last.x, matrices.get(matrices.size() - 1).last.y);
        matrices.remove(matrices.size() - 1);
        //carriage_.z -= carriage_.angle;
        break;
        
        case '+':
        carriage_.z += carriage_.angle;
        break;
        
        case '-':
        carriage_.z -= carriage_.angle;
        break;
        
        //colours
        
        case '1':
        stroke(colors.strokeA);
        break;
        
        case '2':
        stroke(colors.strokeB);
        break;
        
        case '3':
        stroke(colors.strokeC);
        break;
        
        default:
        break;
          
        }
        
        return carriage_;
        
    }
    
}
