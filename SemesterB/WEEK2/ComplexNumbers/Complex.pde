class Complex{
  
 private final double re;   // the real part
 private final double im;   // the imaginary part

 Complex(double re_, double im_){
  
    re = re_; im = im_;
  
 } 
 
 public double re() { return re; }
 public double im() { return im; }
    
 public String toString() {
   
    if (im == 0) return re + "";
    if (re == 0) return im + "i";
    if (im <  0) return re + " - " + (-im) + "i";
    return re + " + " + im + "i";
    
 }
 
 public double modulus()   { return Math.sqrt(re*re + im*im); }                 // |z|: a moodulus 
 public double argument() { return Math.atan2(im, re); }                        // arg(z):A an argument, ϕ(-PI, PI)
 public float argumentDegrees() { return degrees((float)Math.atan2(im, re)); }  // in degrees
 
 
 public Complex conjugate() {  return new Complex(re, -im); }
 
 public Complex plus(Complex b) {
        Complex a = this;             
        double real = a.re + b.re;
        double imag = a.im + b.im;
        return new Complex(real, imag);
    }
    
 public Complex minus(Complex b) {
        Complex a = this;
        double real = a.re - b.re;
        double imag = a.im - b.im;
        return new Complex(real, imag);
    }
    
 public Complex times(Complex b) {
        Complex a = this;
        double re_ = a.re * b.re - a.im * b.im;
        double im_ = a.re * b.im + a.im * b.re;
        return new Complex(re_, im_);
    }
    
 //scalar multiplication
 public Complex times(double alpha) {
        return new Complex(alpha * re, alpha * im);
    }
  
 public Complex divides(Complex b) {
        Complex a = this;
        return a.times(b.reciprocal());
    }
    
 public Complex divides(double alpha) {
        if (alpha == 0) { println("division by zero"); return new Complex(this.re, this.im); }
        else return new Complex(this.re / alpha, this.im / alpha); 
    } 
    
    
 public Complex sqrt() {
   
        double r = Math.sqrt(this.modulus());
        double theta = this.argument()/2;
        return new Complex(r * Math.cos(theta), r * Math.sin(theta));
   }
  
  
 //       _   _
 // 1/Z = Z/Z*Z = x / (x² + y²) - y / (x² + y²) * i
 public Complex reciprocal() {
        double scale = re*re + im*im;
        return new Complex(re / scale, -im / scale);
    }
    
 public Complex exp() {
        return new Complex(Math.exp(re) * Math.cos(im), Math.exp(re) * Math.sin(im));
    }
    
 public Complex sin() {
        return new Complex(Math.sin(re) * Math.cosh(im), Math.cos(re) * Math.sinh(im));
    }


 public Complex cos() {
        return new Complex(Math.cos(re) * Math.cosh(im), -Math.sin(re) * Math.sinh(im));
    }

    
 public Complex tan() {
        return sin().divides(cos());
    }
 
}
