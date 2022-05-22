#include <stdio.h>

#include "cmath.c"

void main(){
    double base;
    double power;

    printf("Agrument: ");
    scanf("%lf", &power);
    printf("exp(%lf) = %.20lf\n", power, fexp(power));

    printf("Agrument: ");
    scanf("%lf", &power);
    printf("ln(%lf) = %.20lf\n", power, fln(power));

    printf("Base: ");
    scanf("%lf", &base);
    printf("Power: ");
    scanf("%lf", &power);
    printf("%lf ** %lf = %.20lf\n", base, power, fpow(base, power));
}