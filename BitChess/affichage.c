#include "stdio.h"
#include "definition.h"

void afficherBoard(BOARD *board){
    int i,pieces , trv;
    MOT64 shiftMe = 1ULL;
    printf("\n  A    B    C    D    E    F    G    H");
    printf("\n-----------------------------------------\n");
    for (i=0;i<64;i++){
        // trv = false càd il n'y a pas de pièce dans la case i
        trv = FALSE;
        // saut de ligne chaque 8 cases
        if((i%8 == 0) && (i!=0)) printf("|  %d\n-----------------------------------------\n",i/8);
        //vérifier pour chaque case s'il y a une pièce parmi les 12 catégories
        for (pieces=1;pieces<13;pieces++){
            if( (shiftMe << i) & board->pieces[pieces] ){
                trv=TRUE;
                switch (pieces){
                    case B_pions: printf("| bP ");break;
                    case B_cavaliers: printf("| bC ");break;
                    case B_tours: printf("| bT ");break;
                    case B_dame: printf("| bD ");break;
                    case B_roi: printf("| bR ");break;
                    case B_fous: printf("| bF ");break;

                    case N_pions: printf("| nP ");break;
                    case N_cavaliers: printf("| nC ");break;
                    case N_tours: printf("| nT ");break;
                    case N_dame: printf("| nD ");break;
                    case N_roi: printf("| nR ");break;
                    case N_fous: printf("| nF ");break;
                    default : break;
                }
                // pour optimiser (une fois trv, on ne vérifier pas pour les autres pièces
                // car une case est occupée par une seule pièce
                pieces=13;
            }
        }
        // case vide
        if (!trv) printf("|    ");
    }
    printf("|  %d\n-----------------------------------------\n\n",8);
}
