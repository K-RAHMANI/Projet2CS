#include "definition.h"

MOT64 MASK[64];

void initMask (){
    int mot,bit,index;
    // initialiser à 0
    for (index=0;index<64;index++){
        MASK[index]= 0ULL;
    }
    // initialiser chaque mot
    for (mot=0;mot<64;mot++){
           MASK[mot] |= (1ULL << mot);
    }
}
// rendre le bit nCase du mot à 1
void setBitTo1 (MOT64 *mot, int nCase){
    *mot |= MASK[nCase];
}
// obtenir le mask qui contient 1 à la position n
MOT64 getMask(int n){
    return MASK[n];
}

// initialisation du board:
void initBoard (BOARD *board){
    int i;
    // initialiser tour
    board->tour = BLANC;
    //initialiser les roques
    board->roque[0]=0;board->roque[1]=0;
    board->roque[2]=0;board->roque[3]=0;
    // initialiser tt les bits à 0
    for (i=0;i<14;i++){
        board->pieces[i]=0ULL;
    }
    // initialiser les pions blanc
    for (i=48;i<56;i++){
        setBitTo1(&board->pieces[B_pions],i);
    }
    // initialiser les pions blanc
    for (i=8;i<16;i++){
        setBitTo1(&board->pieces[N_pions],i);
    }
    // les autres pièces blanches.
    // tour
        setBitTo1(&board->pieces[B_tours],56);
        setBitTo1(&board->pieces[B_tours],63);
        setBitTo1(&board->pieces[N_tours],0);
        setBitTo1(&board->pieces[N_tours],7);
    // cavaliers
        setBitTo1(&board->pieces[B_cavaliers],57);
        setBitTo1(&board->pieces[B_cavaliers],62);
        setBitTo1(&board->pieces[N_cavaliers],1);
        setBitTo1(&board->pieces[N_cavaliers],6);
    // fous
        setBitTo1(&board->pieces[B_fous],58);
        setBitTo1(&board->pieces[B_fous],61);
        setBitTo1(&board->pieces[N_fous],2);
        setBitTo1(&board->pieces[N_fous],5);
    // dame
        setBitTo1(&board->pieces[B_dame],59);
        setBitTo1(&board->pieces[N_dame],3);
    // roi
        setBitTo1(&board->pieces[B_roi],60);
        setBitTo1(&board->pieces[N_roi],4);
    // initialiser le mot des pièces blanches
    board->piecesBlanc = board->pieces[B_pions] | board->pieces[B_tours] | board->pieces[B_cavaliers]
                        | board->pieces[B_fous] | board->pieces[B_dame] | board->pieces[B_roi];
    // initialiser le mot des pièces noires
    board->piecesNoir= board->pieces[N_pions] | board->pieces[N_tours] | board->pieces[N_cavaliers]
                        | board->pieces[N_fous] | board->pieces[N_dame] | board->pieces[N_roi];
    // initialiser le mot de tout les pièces
     board->toutPieces = board->piecesNoir | board->piecesBlanc;
}

// rendre le bit nCase du mot à 1
void setBitTo0 (MOT64 *mot, int nCase){
    *mot ^= MASK[nCase];
}

void testMot(MOT64 mot)
{
    int i;
    MOT64 shiftMe = 1ULL;
    printf("\n");
    for (i=0;i<64;i++){
        if((i%8 == 0) && (i!=0)) printf("\n");
            if( (shiftMe << i) & mot ){
                    printf(" x ");
            } else printf(" - ");
    }
    printf("\n");
}




