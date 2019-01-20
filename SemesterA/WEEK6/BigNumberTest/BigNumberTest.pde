/*

BIG BIG NUMBERS 

NumberFormat is the abstract base class for all number formats. 

This class provides the interface for formatting and parsing numbers. 

NumberFormat also provides methods for determining which locales have 
number formats, and what their names are.

NumberFormat helps you to format and parse numbers for any locale. 
Your code can be completely independent of the locale conventions for decimal 
points, thousands-separators, or even the particular decimal digits used, 
or whether the number format is even decimal.

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/

import java.text.NumberFormat;
NumberFormat nf = java.text.NumberFormat.getInstance();
println(nf.format(Math.pow(10, 80)));

println(nf(pow(10, 80),99,99));
