/*

function plotOnBell(x,scale){
  //This is the real workhorse of this algorithm. It returns values along a bell curve from 0 - 1 - 0 with an input of 0 - 1.
  scale = scale || false;
  var stdD = .125
  var mean = .5
  if(scale){
    return  1 / (( 1/( stdD * Math.sqrt(2 * Math.PI) ) ) * Math.pow(Math.E , -1 * Math.pow(x - mean, 2) / (2 * Math.pow(stdD,2))));
  }else{
     return (( 1/( stdD * Math.sqrt(2 * Math.PI) ) ) * Math.pow(Math.E , -1 * Math.pow(x - mean, 2) / (2 * Math.pow(stdD,2)))) * plotOnBell(.5,true);
  }
}

var step = .5;
var limit = 100;
var shapeAPoints = [];
var shapeBPoints = [];
var shapeCPoints = [];
var shapeDPoints = [];
var shapeEPoints = [];

for(i = step ; i < limit ; i += step){

  var plot = plotOnBell(i / limit);
 
  shapeAPoints.push([i, 50 - (50 * plot)]);
  shapeBPoints.push([i, 50 - (40 * plot)]);
  shapeCPoints.push([i, 50 - (30 * plot)]);
  shapeDPoints.push([i, 50 - (20 * plot)]);
  shapeEPoints.push([i, 50 - (10 * plot)]);
    
}


makePath(shapeAPoints);
makePath(shapeBPoints);
makePath(shapeCPoints);
makePath(shapeDPoints);
makePath(shapeEPoints);

*/
