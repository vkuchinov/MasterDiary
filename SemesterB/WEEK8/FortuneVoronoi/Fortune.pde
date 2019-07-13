

void drawParabola(float fx_, float fy_, float dy_) {
  
                float alpha = (float)Math.sqrt((dy_*dy_)-(fy_*fy_));
                float p0x = fx_ - alpha;
                float p0y = 0.0;
                float p1x = fx_;
                float p1y = fy_ + dy_;
                float p2x = fx_ + alpha;
                float p2y = 0.0;
                
                noFill();
                stroke(128);
                strokeWeight(1.0);

                Quadratic q = new Quadratic(new PVector(fx_, fy_), new PVector(p0x, p0y), new PVector(p1x, p1y), new PVector(p2x, p2y));
                
                quads.add(q);
            
}
