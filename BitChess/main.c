#include <stdio.h>
#include <stdlib.h>
#include "definition.h"

int main()
{
    initMask();
    BOARD board[1];
    initBoard(board);
    while (1){
        afficherBoard(board);
        deplacer(board);
        //deplacerAI(board);
    }
    return 0;
}
