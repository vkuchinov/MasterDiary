package mandelbrot;

import processing.core.*;



public class renderMandelbrot extends PApplet {
	
	private static final long serialVersionUID = 1L;

	PImage test;
	
	public void setup(){
		
		boolean white = true;
		size(15000, 15000);
		background(255);


		// It all starts with the width, try higher or lower values
		float w = 1;
		float h = 1; 

		double xmin = -w;
		double ymin = -h - 0.2;

		loadPixels();

		//of iterations for each point on the complex plane
		int maxiterations = 256 ;

		double xmax = xmin + w;
		// y goes from ymin to ymax
		double ymax = ymin + h;

		// Calculate amount we increment x,y for each pixel
		double dx = (xmax - xmin) / (width);
		double dy = (ymax - ymin) / (height);

		// Start y
		double y = ymin;
		for (int j = 0; j < height; j++) {
		  // Start x
		  double x = xmin;
		  for (int i = 0; i < width; i++) {

		    // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
		    double a = x;
		    double b = y;
		    int n = 0;
		    while (n < maxiterations) {
		      double aa = a * a;
		      double bb = b * b;
		      double twoab = 2.0 * a * b;
		      a = aa - bb + x;
		      b = twoab + y;
		      // Infinty in our finite world is simple, let's just consider it 16
		      if (aa + bb > 16.0) {
		        break;  // Bail
		      }
		      n++;
		      if(white) { white = false; } else { white = true; }
		    }


		    if (n == maxiterations) {
		      pixels[i+j*width] = color(0);
		    } else {
		      
		        if(n%2 == 0)  pixels[i+j*width] = color(0);
		        if(n%3 == 0)  pixels[i+j*width] = color(90, 55, 255);
		        if(n%3 != 0 && n%2 != 0)  pixels[i+j*width] = color(255, 0, 240);
		    }
		    x += dx;
		  }
		  y += dy;
		  
		}

		updatePixels();
		//test = createImage(800, 800, RGB);
		
		//ImageIO.write(test, "png", new File("output.png"));
		saveFrame("/Users/me/Desktop/output.png");
		noLoop();
		
		
		
	}
	
	
	public static void main(String[] args) {

		PApplet.main(new String[] { "--present", "mandelbrot.renderMandelbrot" });
		long heapsize=Runtime.getRuntime().totalMemory();
	    System.out.println("heapsize is::"+heapsize);
	    
	}
}
