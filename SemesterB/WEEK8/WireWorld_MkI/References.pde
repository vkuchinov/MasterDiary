/* 

# WireWorld
#
# rules: 6
#
# Golly rule-table format.
# Each rule: C,N,NE,E,SE,S,SW,W,NW,C'
#
# Default for transitions not listed: no change
#
# Variables are bound within each transition. 
# For example, if a={1,2} then 4,a,0->a represents
# two transitions: 4,1,0->1 and 4,2,0->2
# (This is why we need to repeat the variables below.
#  In this case the method isn't really helping.)
#
n_states:4
neighborhood:Moore
symmetries:rotate8
var a={0,1,2,3}
var b={0,1,2,3}
var c={0,1,2,3}
var d={0,1,2,3}
var e={0,1,2,3}
var f={0,1,2,3}
var g={0,1,2,3}
var h={0,1,2,3}
var i={0,2,3}
var j={0,2,3}
var k={0,2,3}
var l={0,2,3}
var m={0,2,3}
var n={0,2,3}
1,a,b,c,d,e,f,g,h,2
2,a,b,c,d,e,f,g,h,3
3,i,j,k,l,m,n,a,1,1
3,i,j,k,l,m,1,n,1,1
3,i,j,k,l,1,m,n,1,1
3,i,j,k,1,l,m,n,1,1

*/
