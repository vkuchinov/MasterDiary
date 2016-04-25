double sigma(double x_, double a_, float alpha_) {
    return 1.0 / (1.0 + Math.exp(-4.0/alpha_ * (x_ - a_)));
}

double sigma2D(double x_, double a_, double b_) {
    return sigma(x_, a_, ALPHA_N) * (1.0 - sigma(x_, b_, ALPHA_N));
}

double S(double n_, double m_) {
    double alive = sigma(m_, 0.5, ALPHA_M);
    return sigma2D(n_, lerp(B1, D1, (float)alive), lerp(B2, D2, (float)alive));
}
