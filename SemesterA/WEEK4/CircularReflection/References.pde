/*

var Physics = {
    
    bounce_ball_off_world: function(ball, world) {        
 
        var contact_pt = this.find_contact_point(world, ball);
        ball.set_point(contact_pt.x, contact_pt.y);

        var new_ball_vel = this.reflect_ball(world, ball);
        ball.set_velocity(new_ball_vel.x, new_ball_vel.y);
    },
    
    find_contact_point: function(world, ball) {
        // see http://gamedev.stackexchange.com/a/29658
        var A = world.point();
        var B = ball.point().subtract(ball.velocity());
        var C = ball.point();
        var R = world.r;
        var r = ball.r;
        
        var AB = B.subtract(A);
        var BC = C.subtract(B);
        var AB_len = AB.get_length();
        var BC_len = BC.get_length();
        
        // if BC_len == 0, then B and C are equal, meaning D is also equal.
        // Continuing will produce divide-by-zero error
        if ( ! BC_len ) {
            return C;
        }

        var b = AB.dot(BC) / Math.pow(BC_len, 2) * -1;
        var c = (Math.pow(AB_len, 2) - Math.pow(R - r, 2)) / Math.pow(BC_len, 2);
        var d = b * b - c;
        var k = b - Math.sqrt(d);
        
        if ( k < 0 ) {
            k = b + Math.sqrt(d);
        }
        
        var BD = C.subtract(B);
        var BD_len = BC_len * k;
        BD.set_length(BD_len);
        
        var D = B.add(BD);
        return D;
    },
    
    reflect_ball: function(world, ball) {
        // see http://stackoverflow.com/questions/573084/bounce-angle
        var world_pt = world.point();
        var ball_pt = ball.point();
        var v = ball.velocity();
        var n = ball_pt.subtract(world_pt).normalized();
        
        // assume perfect elasticity for now
        // TODO: add elasticity attr to balls
        var ball_elasticity = 1.0;
        var world_elasticity = 1.0;
        var restitution = ball_elasticity * world_elasticity;
        
        // solve reflection
        var u = n.multiply(v.dot(n));
        var w = v.subtract(u);
        var v_after = w.subtract(u);
        var reflection = v_after.subtract(v).multiply(restitution);
        
        // return new velocity
        var new_ball_vel = v.add(reflection);
        return new_ball_vel
    },
};

*/
