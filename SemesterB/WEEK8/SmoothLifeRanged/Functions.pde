void clearField(int x_) {
  
    double[][] cur_field = fields[current_field];

    for(int i=0; i < field_dims.length; i++) {
        for(int j=0; j< field_dims[i].length; j++) {
          cur_field[i][j] = x_;
        }
    }
}

void renderField() {
  
    //var image_buf = image_data.data;            
    //var image_ptr = 0;
    
    double[][] cur_field = fields[current_field];
    
    for(int i = 0; i < field_dims.length; i++) {
        for(int j = 0; j < field_dims[i].length; j++) {
          
            double s = cur_field[i][j];
       
                color setColor = color((int)map((float)s, 0.0, 1.0, 0, 255));
                imageData.set(i, j, setColor);
       
                
        }
    }
    image(imageData, 0, 0, imageData.width, imageData.height);

}


void addSpeckles(int count_, float intensity_) {
  
    curr_field = fields[current_field];

    for(int i=0; i< count_; ++i) {
      
        int u = (int)(Math.floor(Math.random() * (field_dims.length - INNER_RADIUS)));
        int v = (int)(Math.floor(Math.random() * (field_dims[0].length - INNER_RADIUS)));

        for(int x= 0; x < INNER_RADIUS; x++) {
            for(int y = 0; y < INNER_RADIUS; y++) {
                curr_field[u+x][v+y] = intensity_;
            }
        }
    }
    
}

void nextStep() {
    curr_field = fields[current_field];
    current_field = (current_field + 1) % fields.length;
    double[][] next_field = fields[current_field];

    for(int i=0; i<field_dims.length; i++) {
        for(int j=0; j<field_dims[0].length; j++) {
            imaginary_field[i][j] = 0.0;
        }
    }
  
    FFT2D(1, LOG_RES, curr_field, imaginary_field);
    fieldMultiply(curr_field, imaginary_field, M_re, M_im, M_re_buffer, M_im_buffer);
    FFT2D(-1, LOG_RES, M_re_buffer, M_im_buffer);
    fieldMultiply(curr_field, imaginary_field, N_re, N_im, N_re_buffer, N_im_buffer);
    FFT2D(-1, LOG_RES, N_re_buffer, N_im_buffer);
    

    for(int i=0; i<next_field.length; ++i) {
        for(int j=0; j<next_field.length; ++j) {
            next_field[i][j] = S(N_re_buffer[i][j], M_re_buffer[i][j]);
        }
    }
}

void fieldMultiply(double[][] a_re_, double[][] a_im_, double[][] b_re_, double[][] b_im_, double[][] c_re_, double[][] c_im_) {
  
    for(int i=0; i< field_dims[0].length; i++) {
      
        double[] Ar = a_re_[i];
        double[] Ai = a_im_[i];
        double[] Br = b_re_[i];
        double[] Bi = b_im_[i];
        double[] Cr = c_re_[i];
        double[] Ci = c_im_[i];
        
        for(int j=0; j<field_dims[1].length; j++) {
          
            double a = Ar[j];
            double b = Ai[j];
            double c = Br[j];
            double d = Bi[j];
            double t = a * (c + d);
            
            Cr[j] = t - d*(a+b);
            Ci[j] = t + c*(b-a);
            
        }
    }
}
