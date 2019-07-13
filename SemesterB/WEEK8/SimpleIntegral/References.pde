/*
taken from Wikipedia

def calculate_definite_integral_of_f(f, initial_step_size):
    '''
    This algorithm calculates the definite integral of a function
    from 0 to 1, adaptively, by choosing smaller steps near
    problematic points.
    '''
    x = 0.0
    h = initial_step_size
    accumulator = 0.0
    while x < 1.0:
        if x + h > 1.0:
            h = 1.0 - x
        quad_this_step =
        if error_too_big_in_quadrature_of_over_range(f, [x,x+h]):
            h = make_h_smaller(h)
        else:
            accumulator += quadrature_of_f_over_range(f, [x,x+h])
            x += h
            if error_too_small_in_quadrature_of_over_range(f, [x,x+h]):
                h = make_h_larger(h) # Avoid wasting time on tiny steps.
    return accumulator






*/
