#include <stdio.h>

extern int goASM();       // Delklarujemy funkcję goASM jako pochodzącą z zewnątrz
extern int dummyRandom(); // To jest po prostu głupie 

void main(){
    int i = goASM(); // Wywołanie
    int random = dummyRandom();
    printf("goASM() = %d\n", i);
    printf("Liczba losowa to: %d\n", random);
}