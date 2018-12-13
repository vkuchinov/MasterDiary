String Base10ToBaseN(int N_, int number_)

{
    int Q = number_ / N_, R = number_ % N_;

    if (Q == 0) { return Integer.toString(R); }
    else { return Base10ToBaseN(N_, Q) + Integer.toString(R); }  
    
}
