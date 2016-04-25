/*

BULKS TO ARRAYLIST

@author   Vladimir V. KUCHINOV
@email    helloworld@vkuchinov.co.uk

*/
import java.util.Collections;
import java.util.Arrays;
import java.util.List;

ArrayList<Float> data = new ArrayList<Float>();

//classical way
data.add(5.43);
println(data.size());

Float[] setOfFloats = new Float[]{1.32, 0.543, 1.321, 99.9};
data.addAll((List)Arrays.asList(setOfFloats));
println(data.size());
