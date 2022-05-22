
double recursive_pow(double base, int exponent){
    if (!exponent) {return 1;}
    else {return recursive_pow(base, exponent - 1) * base;}
}

double recursive_factorial(int value){
    if (!value) {return 1;}
    else {return recursive_factorial(value - 1) * value;}
}

// Fast square root using babylonian method
double sqrt(double value){
    double guess = .5 * value;
    for (int i = 0; i < 100; i++){
        guess = .5 * (guess + value / guess);
    }
    return guess;
}

// This is great for small inputs
double exp(double exponent){
    double output = 0;
    for (int i = 0; i < 100; i++){
        output += recursive_pow(exponent, i) / recursive_factorial(i);
    }
    return output;
}

// Modulo but the divisor can be any real number
double fmod(double value, double mod){
    int mult = value / mod;
    return value - mult * mod;
}

// Quotient but the divisor can be any real number
int quotient(double value, double mod){
    int mult = value / mod;
    return mult * mod;
}

// This should keep the accuracy for all reals
double fexp(double exponent){
    double R = fmod(exponent, 1);
    int Q = quotient(exponent, 1);

    double E_CONST = exp(1);

    double Q_PART = recursive_pow(E_CONST, Q);
    double R_PART = exp(R);
    return R_PART * Q_PART;
}

// Natural logaritm
double fln(double value){
    double guess = sqrt(value);
    for (int i = 0; i < 100; i++){
        guess = guess - (fexp(guess) - value) / fexp(guess);
    }
    return guess;
}

// You put real base and real power, and you real output
double fpow(double base, double power){
    double exponent = fln(base) * power;
    return fexp(exponent);
}