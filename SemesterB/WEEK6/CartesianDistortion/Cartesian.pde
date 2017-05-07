class Cartesian {

  float min = 0;
  float max = 1;
  float d = 3;
  float focus = 0;

  Cartesian(float d_, float[] extent_) { 

    d = d_;
    min = extent_[0];
    max = extent_[1];
  }

  float Cartesian(float value_) {

    float Dmax_x = (value_ < focus ? min : max) - focus;
    float Dnorm_x = value_ - focus;
    return G(Dnorm_x / Dmax_x) * Dmax_x + focus;
  }

  float G(float value_) { 
    return (d + 1) * value_ / (d * value_ + 1);
  }

  Cartesian extent(float[] values_) {

    min =+ values_[0]; 
    max =+ values_[1];

    return this;
  };

  Cartesian d(float value_) {

    d =+ value_;
    return this;
  };

  Cartesian focus (float value_) {

    focus =+ value_;
    return this;
  };

  float set(float value_) { 
    return Cartesian(value_);
  }

  Cartesian get() { 
    return this;
  }
}

