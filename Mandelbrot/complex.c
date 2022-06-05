#include <stdio.h>

#define Y 40
#define X 2 * Y

#define SCALE 0.2

#define OFFSET_X .5
#define OFFSET_Y 0

#define SCALE_X 0.1
#define SCALE_Y 0.2

#pragma pack (push, 1)
typedef struct complex {
    double real;
    double imag;
} complex;
#pragma pack (pop)

extern double abss(complex* point);

extern complex* complex_square(complex* value, complex* offset);

int isInMandelbrot(complex value){
    complex p;
    p.real = 0;
    p.imag = 0;

    for (int counter = 0; counter < 1024; counter++){
        p = *complex_square(&p, &value);
        if (abss(&p) > 4){return counter;}
    }
    return 1023;
}

void renderFrame(){
    complex point;
    char buffer[512 * 1024];
    int index = 0;
    int value;

    for (int y = Y; y > -Y; y--){
        for (int x = -X; x < X; x++){
            point.real = x * SCALE_X * SCALE - OFFSET_X; 
            point.imag = y * SCALE_Y * SCALE + OFFSET_Y;

            value = isInMandelbrot(point);

            if (value > 1020){
                for (long int i = 0; i < sizeof "\033[0;34m█\033[0;0m" - 1; i++){
                    buffer[index] = "\033[0;34m█\033[0;0m"[i];
                    index++;
                }
            }
            else if (value > 50){
                for (long int i = 0; i < sizeof "\033[0;32m█\033[0;0m" - 1; i++){
                    buffer[index] = "\033[0;32m█\033[0;0m"[i];
                    index++;
                }
            }
            else if (value > 10){
                for (long int i = 0; i < sizeof "\033[0;33m█\033[0;0m" - 1; i++){
                    buffer[index] = "\033[0;33m█\033[0;0m"[i];
                    index++;
                }
            }
            else if (value > 5){
                for (long int i = 0; i < sizeof "\033[0;35m█\033[0;0m" - 1; i++){
                    buffer[index] = "\033[0;35m█\033[0;0m"[i];
                    index++;
                }
            } 
            else if (value > 2){
                for (long int i = 0; i < sizeof "\033[0;31m█\033[0;0m" - 1; i++){
                    buffer[index] = "\033[0;31m█\033[0;0m"[i];
                    index++;
                }
            }
            else {
                buffer[index] = ' ';
                index++;
            }
        }
        buffer[index] = '\n';
        index++;
    }
    printf("%s", buffer);
}

void main(){
        renderFrame();
}