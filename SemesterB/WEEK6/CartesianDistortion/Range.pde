class Range extends IntList{
  
    Range(int min_, int max_, int steps_){

          for(int i = min_; i < max_; i+= (int)((max_ - min_) / steps_)){
          this.append(i);
          } 
          this.append(max_);
      
    }

}
