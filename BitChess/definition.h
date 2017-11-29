#ifndef DEFINITION_H
#define DEFINITION_H

#include "stdlib.h"
#include "stdio.h"
#include "string.h"
#include <stdbool.h>
#include <inttypes.h>


#define MAX 1
#define MIN -1
#define INFINI 10000

#define DEBUG
// le macro ERREURS(n) est pour debuger le program "il montre les erreurs, ptr null ..etc"
#ifndef DEBUG
#define ERREURS(n)
#else
#define ERREURS(n) \
if(!(n)) { \
printf("%s - Failed",#n); \
printf("On %s ",__DATE__); \
printf("At %s ",__TIME__); \
printf("In File %s ",__FILE__); \
printf("At Line %d\n",__LINE__); \
exit(1);}
#endif

// mot de 64 bits (Type)
typedef unsigned long long MOT64;

// Boolean
enum { FALSE, TRUE };

// Les coleurs du jeu
enum { BLANC, NOIR };

// Les pièces et ces valeurs
enum {Case_vide, B_roi, B_dame , B_fous, B_cavaliers, B_tours, B_pions , N_roi, N_dame , N_fous, N_cavaliers, N_tours, N_pions};
// les 8 directions possible dans l'echequier
enum {DROITE,AVANT_DROITE,AVANT,AVANT_GAUCHE,GAUCHE,ARRIERE_GAUCHE,ARRIERE,ARRIERE_DROITE};


// la structure du board
typedef struct {
    int roque[4];           //roque[0] et roque[1] pour les blancs, roque[2] et roque[3] pour les noire
                        // Vau 0 si le roque est possible, -1 s'il est impossible, 1 s'il est effectuer
                        //roque[0] et roque[2] pour le petit roque
                        //roque[1] et roque[3] pour le grand roque
    //tout les pièces blanches
	MOT64 piecesBlanc;
	MOT64 piecesNoir;
	MOT64 toutPieces;
    // tour du jeu
	int tour; //blanc=0 , noir=1
	// 12 mots de 64bits pour représenter tous les pièces
	MOT64 pieces[12];

} BOARD;

typedef struct configuration{
	char board[8][8];		// L'echiquier
	int val;			// Estimation de la configuration
	int turn;			// Le numero du tour de joueur, on l'incremente chaque fois qu'on joue
	int roque[4];           //roque[0] et roque[1] pour les blancs, roque[2] et roque[3] pour les noire
                            // Vau 0 si le roque est possible, -1 s'il est impossible, 1 s'il est effectuer
                            //roque[0] et roque[2] pour le petit roque
                            //roque[1] et roque[3] pour le grand roque
} configuration;

//Variables global



//Les fonctions
extern void initMask ();
//extern void setBitTo1 (MOT64* mot, int nCase);
extern MOT64 getMask(int n);

#endif

