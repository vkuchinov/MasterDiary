/*

if (slope != 0) {

C =  Math.pow(0, 2) + Math.pow(B_.x, 2) - 2 * B_.x * 0 + Math.pow(0, 2) - Math.pow(radius, 2);
B = -2.0 * 0;
A = 1.0;
disc = Math.pow(B, 2) - 4.0 * 1.0 * C;
if (disc < 0) { 
return intersections;
} else {

y1 = (-B + Math.sqrt(disc)) / (2.0 * A);
y2 = (-B - Math.sqrt(disc)) / (2.0 * A);
x1 = B_.x;
x2 = B_.x;
}

PVector point1 = new PVector((float)x1, (float)y1);
PVector point2 = new PVector((float)x2, (float)y2);

if (PVector.dist(A_, point2) > PVector.dist(A_, point1)) {
intersections.add(point1);
} else { 
intersections.add(point2);
}
return intersections;
}




*/
