/*

AGENT DISTRIBUTIONS
adding one by one to quadtree dividing it into children
Agent ≠ Node, have to build two-way bridge 

Node.objects   > Agent         //always shoud be 1 if QuadTree is adaptive, more than 1 if has certain levels
Agent.parent   > QuadTree;
Agent.parent.n > Node

[1] arranging on-the-fly 

    [a] by adding next agent algorithm check if quadtree has
        already agent within 
    [b] and quadtree children
    [c] rearranging agents withing quadree and children
    
[2] distributing after complete quadtree is formed

    [a] goes along tree down till agent reaches the best 
        node (minimal dimensions)

SEARCH NEIGHBOURS BY K 

There are at least two hybrid algorithms to follow: 

[1] Exploring chilndren / parent nodes till found neighbours > K
    Determine worst neighbour (by maximum distance)
    Proceed through search by radius algorithm with given max distance
    If # of neighbours is less than K than look for worst distance again
    Sort neighbours and return best K of them
    
[2] Dynamic radius growth, with givet step (dynamic or given)
    Going till # of neighbours is equal or more to K
    Sort neighbours and return best K of them
    
*/
