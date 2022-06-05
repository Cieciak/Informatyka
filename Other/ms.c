#include <stdio.h>
#include <time.h>

#include "cmath.c"

#define X 50
#define Y 25
#define T_MOD 10
#define COLOR_DELTA 5

double t = 0;
double s = 1;

double asm_exp(double x);

double epilticCurve(double x, double y){return x*x*x - x + 1 - y*y;}

double func(int dx, int dy){
    double x = dx * .1 * s;
    double y = dy * .2 * s;

    return y*(y - t) * x*(x + t);
}

void delay(int milliseconds)
{
    long pause;
    clock_t now,then;

    pause = milliseconds*(CLOCKS_PER_SEC/1000);
    now = then = clock();
    while( (now-then) < pause )
        now = clock();
}

void renderFrame(){
    double i;
    t =  fmod(t + 0.005, T_MOD);

    printf("t=%lf\n", t);
    for(int y = Y; y > -Y-1; y--){
        for(int x = -X; x < X+1; x++){
            i = func(x, y);
            if (i > 1){printf(" ");}

            if (i <= 0){printf("█");}

            if (i > 0 && i <= 1){printf("%d", (int)(10 * fmod(i, 1)));} 
        }
        printf(" %d\n", y);
    }
}

void renderColorFrame(){
    double i;
    t =  fmod(t + 0.005, T_MOD);

    
    for(int y = Y; y > -Y; y--){
        for(int x = -X; x < X; x++){
            i = func(x, y) / COLOR_DELTA;
            if      (i > 1)          {printf("\033[0;32m█\033[0;0m");} // Green
            else if (i > 0 && i <= 1){printf("\033[0;33m█\033[0;0m");} // Yellow
            else if (i == 0)         {printf("\033[0;37m█\033[0;0m");} // Zero
            else if (i > -1 && i < 0){printf("\033[0;31m█\033[0;0m");} // Red
            else if (i <= -1)        {printf("\033[0;35m█\033[0;0m");} // Purple
        }
        printf(" %d ", y);
        if (!y){printf("t=%lf", t);}
        printf("\n");
    }
}

void main(){
    A:
    renderColorFrame();
    delay(100);
    printf("\e[1;1H\e[2J");
    goto A;
}
