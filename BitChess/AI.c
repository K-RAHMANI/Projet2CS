#include "definition.h"

void deplacerAI(BOARD* conf){
        configuration board;
        /// tour de la machine :
        configuration T[100];
        bool deplacer;

        int score = +INFINI;
        int j = -1,i,cout,choix=0,hauteur=2,k,m,l;
        int n = cout_possible_bitboard(conf,BLANC,T);
        for (i=0; i<n; i++) {
            if(choix==1){
                cout = minmax_ab( T[i], MAX, hauteur,-INFINI, +INFINI);
            }else{
                cout = minmax( T[i], MAX, hauteur);
            }
               if ( cout < score ) {
                score = cout;
                j = i;
               }
        }
        if ( j != -1 ) {
           printf("\n\ncout = %d \n\n",score);
           tableau2bitBoard(conf,T[j]);
        }
        deplacer = false;
        changerTour(&conf->tour);
}

void copyBitBoard(const BOARD* src,BOARD* dest){
    int i;for (i=0;i<14;i++){dest->pieces[i] = 0ULL;}
    // copier toute la structure
    for (i=0;i<14;i++){dest->pieces[i] = src->pieces[i];}
    for (i=0;i<4;i++){dest->roque[i] = src->roque[i];}
    dest->piecesBlanc = src->piecesBlanc;
    dest->piecesNoir = src->piecesNoir;
    dest->tour = src->tour;
    dest->toutPieces = src->toutPieces;
}

//Convertir une configuration en bitBoard vers une autre en Tableau[8][8]
//Elle est necessaire pour la fonction d'évaluation (pour ne pas touché dans la fonction d'évaluation)
void bitBoard2Tableau(BOARD* bitboard, configuration* configuration){
    int ligne=0,col=0,Case;
    for (Case=0;Case<64;Case++){
            // ligne suivant
        if (Case%8==0 && Case!=0) {
                ligne++;
                col=0;
        }
        configuration->board[ligne][col] = 0 ;
        switch (contenuCase(Case,bitboard)){
            case B_pions: configuration->board[ligne][col] = 'P'; break;
            case B_cavaliers: configuration->board[ligne][col] = 'C';  break;
            case B_tours: configuration->board[ligne][col] = 'T'; break;
            case B_dame: configuration->board[ligne][col] = 'D'; break;
            case B_roi: configuration->board[ligne][col] = 'R'; break;
            case B_fous: configuration->board[ligne][col] = 'F'; break;

            case N_pions: configuration->board[ligne][col] = -'P'; break;
            case N_cavaliers: configuration->board[ligne][col] = -'C'; break;
            case N_tours: configuration->board[ligne][col] = -'T'; break;
            case N_dame: configuration->board[ligne][col] = -'D'; break;
            case N_roi: configuration->board[ligne][col] = -'R'; break;
            case N_fous: configuration->board[ligne][col] = -'F'; break;
            default : configuration->board[ligne][col] = 0; break;
        }
        col++;
    }
    configuration->roque[0] = 0;
	configuration->roque[1] = 0;
	configuration->roque[2] = 0;
	configuration->roque[3] = 0;
	configuration->turn = bitboard->tour;
	configuration->val = 0;
}

void tableau2bitBoard(BOARD* board, configuration configuration){
    int i,j;

    // initialiser tt les bits à 0
    for (i=0;i<14;i++){
        board->pieces[i]=0ULL;
    }

    for(j = 0 ; j <= 7 ; j++)
    {
        for(i = 0 ; i <= 7 ; i++)
        {
            switch(configuration.board[i][j])
            {
                case 'P':
                    setBitTo1(&board->pieces[B_pions],(i*8)+j);
                break;
                case -'P':
                    setBitTo1(&board->pieces[N_pions],(i*8)+j);
                break;
                case 'C':
                    setBitTo1(&board->pieces[B_cavaliers],(i*8)+j);
                break;
                case -'C':
                    setBitTo1(&board->pieces[N_cavaliers],(i*8)+j);
                break;
                case 'F':
                    setBitTo1(&board->pieces[B_fous],(i*8)+j);
                break;
                case -'F':
                    setBitTo1(&board->pieces[N_fous],(i*8)+j);
                break;
                case 'T':
                    setBitTo1(&board->pieces[B_tours],(i*8)+j);
                break;
                case -'T':
                    setBitTo1(&board->pieces[N_tours],(i*8)+j);
                break;
                case 'D':
                    setBitTo1(&board->pieces[B_dame],(i*8)+j);
                break;
                case -'D':
                    setBitTo1(&board->pieces[N_dame],(i*8)+j);
                break;
                case 'R':
                    setBitTo1(&board->pieces[B_roi],(i*8)+j);
                break;
                case -'R':
                    setBitTo1(&board->pieces[N_roi],(i*8)+j);
                break;
            }
        }
    }
    board->tour = configuration.turn%2;
    // initialiser le mot des pièces blanches
    board->piecesBlanc = board->pieces[B_pions] | board->pieces[B_tours] | board->pieces[B_cavaliers]
                        | board->pieces[B_fous] | board->pieces[B_dame] | board->pieces[B_roi];
    // initialiser le mot des pièces noires
    board->piecesNoir= board->pieces[N_pions] | board->pieces[N_tours] | board->pieces[N_cavaliers]
                        | board->pieces[N_fous] | board->pieces[N_dame] | board->pieces[N_roi];
    // initialiser le mot de tout les pièces
    board->toutPieces = board->piecesNoir | board->piecesBlanc;
}

int cout_possible_bitboard(BOARD* board2,int couleur,configuration* configs){
    int Case,i,pieceDest,pieceSrc,n=0;
    BOARD board_cp[1];
    BOARD board[1];
    configuration config;
    if (couleur==MAX) couleur=BLANC;
    else couleur=NOIR;
    copyBitBoard(board2,board_cp);
    for (Case=0;Case<64;Case++){
        // on vérifie que la case contient le pièce du joueur
        pieceSrc = contenuCase(Case,board_cp);
        if (pieceColor(pieceSrc)==couleur){
            // on vérifie la possiblité de déplacer la pièce vers tous les cases
            // si c'est possible on stock la configuration
            for (i=0;i<64;i++){
                pieceDest = contenuCase(i,board_cp);
                if(pieceColor(pieceDest)!=couleur && MouvementPossible(pieceSrc,Case,pieceDest,i,board_cp)){
                    // copy board_cp dans board
                    copyBitBoard(board_cp,board);
                    // Générer la configuration possible
                    //*************************************************************************************************
                    // mettre à jour le mot de la piece courrante
                        setBitTo1(&board->pieces[pieceSrc],i);
                        setBitTo0(&board->pieces[pieceSrc],Case);
                        // tuer une piece si elle existe
                        if (pieceDest!=Case_vide) setBitTo0(&board->pieces[pieceDest],i);
                        // roque impossible après le mouvement de la tour ou le roi
                                if (pieceSrc==B_roi){board->roque[0]=-1;board->roque[1]=-1;}
                                if (pieceSrc==N_roi){board->roque[2]=-1;board->roque[3]=-1;}
                                if (pieceSrc==B_tours){board->roque[0]=-1;board->roque[1]=-1;}
                                if (pieceSrc==N_tours){board->roque[2]=-1;board->roque[3]=-1;}
                        // mettre à jour le mot des pièces blanches
                        board->piecesBlanc = board->pieces[B_pions] | board->pieces[B_tours] | board->pieces[B_cavaliers]
                                            | board->pieces[B_fous] | board->pieces[B_dame] | board->pieces[B_roi];
                        // mettre à jour le mot des pièces noires
                        board->piecesNoir= board->pieces[N_pions] | board->pieces[N_tours] | board->pieces[N_cavaliers]
                                            | board->pieces[N_fous] | board->pieces[N_dame] | board->pieces[N_roi];
                        // mettre à jour le mot de tout les pièces
                         board->toutPieces = board->piecesNoir | board->piecesBlanc;
                    //*************************************************************************************************
                    // Evaluer la configuration et garder que la meilleure
                    bitBoard2Tableau(board,&config);
                    configs[n]=config;
                    // Comptage des configurations possibles
                    n++;
                }
            }
        }
    }
    printf("\nnbr de config possible = %d\n",n);
    return n;
}


