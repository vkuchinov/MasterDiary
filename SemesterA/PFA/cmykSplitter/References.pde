/*

| "BLUE SKY" BRIEF
 
During my recent practise I have found that there is no precise RGB to CMYK conversion in Processing. 
There are some conversion algorithms, however, it is very far from results you get using Photoshop 
or other advanced image processors.

My suggestion is: the most accurate way to do it – to use pre-defined maps of every single colour 
of 16.7M (16 777 216) for reference. The main trick is to process such a vast data partly or to transform it
into formulas.

The minimal task is to create short script/function based on these maps with a reasonable processing time, as
long as one channel map is 4096x4096 pixels matrix ... or ... 16 777 216 pixels in total.

The ideal solution is to 'hack' these maps, to find patterns and to design proper formulas for splitting RGB
to CMYK channels.

I don't know math theory so well to be able to construct formulas from complicated patterns, have to try.
That's the fundamentals of studies.
 
| MOST POPULAR ALGORITHM

 public static int[] rgbToCmyk(int red, int green, int blue)
    {
        int black = Math.min(Math.min(255 - red, 255 - green), 255 - blue);

        if (black!=255) {
            int cyan    = (255 - red - black)/(255 - black);
            int magenta = (255 - green - black)/(255 - black);
            int yellow  = (255 - blue - black)/(255 - black);
            return new int[] {cyan, magenta, yellow, black};
        } else {
            int cyan = 255 - red;
            int magenta = 255 - green;
            int yellow = 255 - blue;
            return new int[] {cyan, magenta, yellow, black};
        }
    }
    

*/
