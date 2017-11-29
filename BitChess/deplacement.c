#include "definition.h"
// conversion d'une position en (lettre,chiffre) vers le num de la case correspondante.
int case2Coor(char s[]){
    char* str[64];
    str[0]="a1";str[1]="b1";str[2]="c1";str[3]="d1";str[4]="e1";str[5]="f1";str[6]="g1";str[7]="h1";
    str[8]="a2";str[9]="b2";str[10]="c2";str[11]="d2";str[12]="e2";str[13]="f2";str[14]="g2";str[15]="h2";
    str[16]="a3";str[17]="b3";str[18]="c3";str[19]="d3";str[20]="e3";str[21]="f3";str[22]="g3";str[23]="h3";
    str[24]="a4";str[25]="b4";str[26]="c4";str[27]="d4";str[28]="e4";str[29]="f4";str[30]="g4";str[31]="h4";
    str[32]="a5";str[33]="b5";str[34]="c5";str[35]="d5";str[36]="e5";str[37]="f5";str[38]="g5";str[39]="h5";
    str[40]="a6";str[41]="b6";str[42]="c6";str[43]="d6";str[44]="e6";str[45]="f6";str[46]="g6";str[47]="h6";
    str[48]="a7";str[49]="b7";str[50]="c7";str[51]="d7";str[52]="e7";str[53]="f7";str[54]="g7";str[55]="h7";
    str[56]="a8";str[57]="b8";str[58]="c8";str[59]="d8";str[60]="e8";str[61]="f8";str[62]="g8";str[63]="h8";
    int i;
    for (i=0;i<64;i++){
         if (strcmp(str[i],s)==0) return i;
    }
}
// en paramètre, la chaine de caractère que l'utilisateur tape ex: a2a3
// la fonction va reteurner les num de case de a2 et a3 à respectivement s (source) et d (destination)
void separerCmd(char cmd[],int* s,int* d) {
    char src[3] ;
    char dest[3] ;
    // la séparation de la chaine de caractère cmd vers src et dest
    src[0] = cmd[0]; src[1] = cmd[1];src[2]='\0';
    dest[0] = cmd[2]; dest[1] = cmd[3];dest[2]='\0';
    // la conversion de src et dest vers les num de case
    *s=case2Coor(src);
    *d=case2Coor(dest);
}
// une fonction qui indique le contenu d'une case, si case occupée alors elle retourn le num de la pièce (quelle pièces)
// sinon vide return 0;
int contenuCase(int k,const BOARD *board){
    MOT64 shiftMe = 1ULL << k;
    int trv=FALSE;
    // on vérifier d'abord s'il y a une piece dans la case sinon vide
    if ( shiftMe & board->toutPieces ) trv=TRUE;
    else return 0;
    // on cherche le contenu de la case dans les mots
    int pieces;
    for (pieces=1;pieces<13;pieces++){
        if (shiftMe & board->pieces[pieces]) return pieces;
    }
    printf("\nOps!!, j ai pas trouve le contenu pourtant que elle existe");
}
// return si la couleur de la pièce (0==Blanc ou 1==Noir)
int pieceColor(int piece){
    if (piece==0) return -1;
    if (piece<=6 && piece>=1) return BLANC;
    else return NOIR;
}
// Changer le tour de blanc vers noir ou l'inverse
void changerTour(int *tour){
    if (*tour==0) *tour=1;
    else *tour=0;
}
// Vérifier s'il y a un obstacle vers le chemin destination
int existeObstacle(int pieceSrc,int caseSrc,int direction,int caseDest, BOARD *board){
    int existe_obstacle=0,i=0;
    switch (pieceSrc){
                    case B_pions:
                        // L'obstacle peut exister seulement dans le cas de mouvement à deux pas
                        if ( (caseDest == caseSrc-16) && (contenuCase(caseSrc-8,board)!=Case_vide) ) existe_obstacle=1;
                        break;
                    case B_tours:
                        // Selon les directions, on vérifier les obstacle dans le chemin
                        while (existe_obstacle==0 && i<8){
                            i++;
                            switch(direction){
                                case AVANT:
                                    if(caseSrc-8*i!=caseDest && contenuCase(caseSrc-8*i,board)!=0) existe_obstacle=1;break;
                                case ARRIERE:
                                    if(caseSrc+8*i!=caseDest && contenuCase(caseSrc+8*i,board)!=0) existe_obstacle=1;break;
                                case DROITE:
                                    if(caseSrc+i!=caseDest && contenuCase(caseSrc+i,board)!=0) existe_obstacle=1;break;
                                case GAUCHE:
                                    if(caseSrc-i!=caseDest && contenuCase(caseSrc-i,board)!=0) existe_obstacle=1;break;
                            }
                            if (caseSrc-8*i==caseDest || caseSrc+8*i==caseDest || caseSrc+i==caseDest || caseSrc-i==caseDest) i=8;
                        }
                        break;
                    case B_dame:
                        while (existe_obstacle==0 && i<8){
                            i++;
                            switch(direction){
                                case ARRIERE_DROITE:
                                    if(caseSrc+8*i+i!=caseDest && contenuCase(caseSrc+8*i+i,board)!=0) existe_obstacle=1;break;
                                case ARRIERE_GAUCHE:
                                    if(caseSrc+8*i-i!=caseDest && contenuCase(caseSrc+8*i-i,board)!=0) existe_obstacle=1;break;
                                case AVANT_DROITE:
                                    if(caseSrc-8*i+i!=caseDest && contenuCase(caseSrc-8*i+i,board)!=0) existe_obstacle=1;break;
                                case AVANT_GAUCHE:
                                    if(caseSrc-8*i-i!=caseDest && contenuCase(caseSrc-8*i-i,board)!=0) existe_obstacle=1;break;
                                case AVANT:
                                    if(caseSrc-8*i!=caseDest && contenuCase(caseSrc-8*i,board)!=0) existe_obstacle=1;break;
                                case ARRIERE:
                                    if(caseSrc+8*i!=caseDest && contenuCase(caseSrc+8*i,board)!=0) existe_obstacle=1;break;
                                case DROITE:
                                    if(caseSrc+i!=caseDest && contenuCase(caseSrc+i,board)!=0) existe_obstacle=1;break;
                                case GAUCHE:
                                    if(caseSrc-i!=caseDest && contenuCase(caseSrc-i,board)!=0) existe_obstacle=1;break;
                            }
                            if (caseSrc+8*i+i==caseDest || caseSrc+8*i-i==caseDest || caseSrc-8*i+i==caseDest || caseSrc-8*i-i==caseDest) i=8;
                            if (caseSrc-8*i==caseDest || caseSrc+8*i==caseDest || caseSrc+i==caseDest || caseSrc-i==caseDest) i=8;
                        }
                        break;
                    case B_fous:
                        while (existe_obstacle==0 && i<8){
                            i++;
                            switch(direction){
                                case ARRIERE_DROITE:
                                    if(caseSrc+8*i+i!=caseDest && contenuCase(caseSrc+8*i+i,board)!=0) existe_obstacle=1;break;
                                case ARRIERE_GAUCHE:
                                    if(caseSrc+8*i-i!=caseDest && contenuCase(caseSrc+8*i-i,board)!=0) existe_obstacle=1;break;
                                case AVANT_DROITE:
                                    if(caseSrc-8*i+i!=caseDest && contenuCase(caseSrc-8*i+i,board)!=0) existe_obstacle=1;break;
                                case AVANT_GAUCHE:
                                    if(caseSrc-8*i-i!=caseDest && contenuCase(caseSrc-8*i-i,board)!=0) existe_obstacle=1;break;
                            }
                            if (caseSrc+8*i+i==caseDest || caseSrc+8*i-i==caseDest || caseSrc-8*i+i==caseDest || caseSrc-8*i-i==caseDest) i=8;
                        }
                        break;
                    case N_pions:
                        // L'obstacle peut exister seulement dans le cas de mouvement à deux pas
                        if ( (caseDest == caseSrc+16) && (contenuCase(caseSrc+8,board)!=Case_vide) ) existe_obstacle=1;
                    break;
                    case N_tours:
                       while (existe_obstacle==0 && i<8){
                            i++;
                            switch(direction){
                                case AVANT:
                                    if(caseSrc-8*i!=caseDest && contenuCase(caseSrc-8*i,board)!=0) existe_obstacle=1;break;
                                case ARRIERE:
                                    if(caseSrc+8*i!=caseDest && contenuCase(caseSrc+8*i,board)!=0) existe_obstacle=1;break;
                                case DROITE:
                                    if(caseSrc+i!=caseDest && contenuCase(caseSrc+i,board)!=0) existe_obstacle=1;break;
                                case GAUCHE:
                                    if(caseSrc-i!=caseDest && contenuCase(caseSrc-i,board)!=0) existe_obstacle=1;break;
                            }
                            if (caseSrc-8*i==caseDest || caseSrc+8*i==caseDest || caseSrc+i==caseDest || caseSrc-i==caseDest) i=8;
                        }
                        break;
                    case N_dame:
                        while (existe_obstacle==0 && i<8){
                            i++;
                            switch(direction){
                                case ARRIERE_DROITE:
                                    if(caseSrc+8*i+i!=caseDest && contenuCase(caseSrc+8*i+i,board)!=0) existe_obstacle=1;break;
                                case ARRIERE_GAUCHE:
                                    if(caseSrc+8*i-i!=caseDest && contenuCase(caseSrc+8*i-i,board)!=0) existe_obstacle=1;break;
                                case AVANT_DROITE:
                                    if(caseSrc-8*i+i!=caseDest && contenuCase(caseSrc-8*i+i,board)!=0) existe_obstacle=1;break;
                                case AVANT_GAUCHE:
                                    if(caseSrc-8*i-i!=caseDest && contenuCase(caseSrc-8*i-i,board)!=0) existe_obstacle=1;break;
                                case AVANT:
                                    if(caseSrc-8*i!=caseDest && contenuCase(caseSrc-8*i,board)!=0) existe_obstacle=1;break;
                                case ARRIERE:
                                    if(caseSrc+8*i!=caseDest && contenuCase(caseSrc+8*i,board)!=0) existe_obstacle=1;break;
                                case DROITE:
                                    if(caseSrc+i!=caseDest && contenuCase(caseSrc+i,board)!=0) existe_obstacle=1;break;
                                case GAUCHE:
                                    if(caseSrc-i!=caseDest && contenuCase(caseSrc-i,board)!=0) existe_obstacle=1;break;
                            }
                            if (caseSrc+8*i+i==caseDest || caseSrc+8*i-i==caseDest || caseSrc-8*i+i==caseDest || caseSrc-8*i-i==caseDest) i=8;
                            if (caseSrc-8*i==caseDest || caseSrc+8*i==caseDest || caseSrc+i==caseDest || caseSrc-i==caseDest) i=8;
                        }
                        break;
                    case N_fous:
                        while (existe_obstacle==0 && i<8){
                            i++;
                            switch(direction){
                                case ARRIERE_DROITE:
                                    if(caseSrc+8*i+i!=caseDest && contenuCase(caseSrc+8*i+i,board)!=0) existe_obstacle=1;break;
                                case ARRIERE_GAUCHE:
                                    if(caseSrc+8*i-i!=caseDest && contenuCase(caseSrc+8*i-i,board)!=0) existe_obstacle=1;break;
                                case AVANT_DROITE:
                                    if(caseSrc-8*i+i!=caseDest && contenuCase(caseSrc-8*i+i,board)!=0) existe_obstacle=1;break;
                                case AVANT_GAUCHE:
                                    if(caseSrc-8*i-i!=caseDest && contenuCase(caseSrc-8*i-i,board)!=0) existe_obstacle=1;break;
                            }
                            if (caseSrc+8*i+i==caseDest || caseSrc+8*i-i==caseDest || caseSrc-8*i+i==caseDest || caseSrc-8*i-i==caseDest) i=8;
                        }
                        break;
                    default : break;
                }
                // J'ai enlevé le msg d'obstacle pour le générateur de mouvements, pour ne pas avoir de msg c'est tt
                //if (existe_obstacle==1) printf("\nMouvement impossible! : Obstacle dans le chemin Direction:%d\n",direction);
    return existe_obstacle;
}
// Vérifier si le mouvement est possible
int MouvementPossible(int pieceSrc,int caseSrc,int pieceDest,int caseDest,const BOARD *board){
    int possible=0, direction=-1;
    int i=0;
    switch (pieceSrc){
                    case B_pions:
                        // Mouvement vers l'avant
                        if ( ((caseDest == caseSrc-8) || (caseSrc>=48 && caseSrc<=55 && caseDest == caseSrc-16 && existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1 )) && pieceDest==0) possible=1;
                        // mouvement pour tuer une pièce
                        if ( (caseDest==caseSrc-7 || caseDest==caseSrc-9) && pieceDest>=7) possible=1;
                        break;
                    case B_cavaliers:
                        if ((caseDest == caseSrc+8+2) || (caseDest == caseSrc+8-2) || (caseDest == caseSrc-8+2 && caseSrc%8!=6) ||
                            (caseDest == caseSrc-8-2 && caseSrc%8!=1) || (caseDest == caseSrc+16+1) ||  (caseDest == caseSrc+16-1) ||
                            (caseDest == caseSrc-16+1) || (caseDest == caseSrc-16-1)) {
                                possible=1;
                            }
                        break;
                    case B_tours:
                        while (possible==0 && i<8){
                            i++;
                            if(caseSrc-8*i==caseDest) {direction=AVANT; if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+8*i==caseDest){direction=ARRIERE; if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+i==caseDest) {direction=DROITE; if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc-i==caseDest) {direction=GAUCHE; if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                        }
                        break;
                    case B_dame:
                        while (possible==0 && i<8){
                            i++;
                            if(caseSrc-8*i==caseDest) {direction=AVANT; if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+8*i==caseDest){direction=ARRIERE; if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+i==caseDest) {direction=DROITE; if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc-i==caseDest) {direction=GAUCHE; if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+8*i+i==caseDest ) {direction=ARRIERE_DROITE;if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+8*i-i==caseDest)  {direction=ARRIERE_GAUCHE;if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc-8*i+i==caseDest)  {direction=AVANT_DROITE;  if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc-8*i-i==caseDest)  {direction=AVANT_GAUCHE;  if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                        }
                        break;
                    case B_roi:
                            if(caseSrc+1==caseDest || caseSrc-1==caseDest  || caseSrc+8-1==caseDest  || caseSrc-8-1==caseDest
                                || caseSrc+8+1==caseDest  || caseSrc-8+1==caseDest  || caseSrc-8==caseDest  || caseSrc+8==caseDest )
                                possible=1;
                        break;
                    case B_fous:
                        while (possible==0 && i<8){
                                i++;
                            if(caseSrc+8*i+i==caseDest ) {direction=ARRIERE_DROITE;if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+8*i-i==caseDest)  {direction=ARRIERE_GAUCHE;if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc-8*i+i==caseDest)  {direction=AVANT_DROITE;  if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc-8*i-i==caseDest)  {direction=AVANT_GAUCHE;  if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                        }
                        break;
                    case N_pions:
                        // avancer le pion
                        if ( ((caseDest == caseSrc+8) || (caseSrc>=8 && caseSrc<=15 && caseDest == caseSrc+16 && existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1)) && pieceDest==0) possible=1;
                        // Tuer une pièce
                        if ((caseDest==caseSrc+7 || caseDest==caseSrc+9) && pieceDest<7 && pieceDest>0) possible=1;
                    break;
                    case N_cavaliers:
                        if ((caseDest == caseSrc+8+2 && caseSrc%8!=6) || (caseDest == caseSrc+8-2 && caseSrc%8!=1) || (caseDest == caseSrc-8+2) ||
                            (caseDest == caseSrc-8-2) || (caseDest == caseSrc+16+1) ||  (caseDest == caseSrc+16-1) ||
                            (caseDest == caseSrc-16+1) || (caseDest == caseSrc-16-1)) {
                                possible=1;
                            }
                        break;
                    case N_tours:
                        while (possible==0 && i<8){
                            i++;
                            if(caseSrc-8*i==caseDest) {direction=AVANT;if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+8*i==caseDest){direction=ARRIERE;if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+i==caseDest) {direction=DROITE;if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc-i==caseDest) {direction=GAUCHE;if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                        }
                        break;
                    case N_dame:
                        while (possible==0 && i<8){
                            i++;
                            if(caseSrc-8*i==caseDest) {direction=AVANT; if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+8*i==caseDest){direction=ARRIERE; if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+i==caseDest) {direction=DROITE; if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc-i==caseDest) {direction=GAUCHE; if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+8*i+i==caseDest ) {direction=ARRIERE_DROITE;if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+8*i-i==caseDest)  {direction=ARRIERE_GAUCHE;if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc-8*i+i==caseDest)  {direction=AVANT_DROITE;  if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc-8*i-i==caseDest)  {direction=AVANT_GAUCHE;  if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                        }
                        break;
                    case N_roi:
                        if(caseSrc+1==caseDest || caseSrc-1==caseDest  || caseSrc+8-1==caseDest  || caseSrc-8-1==caseDest
                                || caseSrc+8+1==caseDest  || caseSrc-8+1==caseDest  || caseSrc-8==caseDest  || caseSrc+8==caseDest )
                                possible=1;
                        break;
                    case N_fous:
                        while (possible==0 && i<8){
                                i++;
                            if(caseSrc+8*i+i==caseDest ) {direction=ARRIERE_DROITE;if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc+8*i-i==caseDest)  {direction=ARRIERE_GAUCHE;if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc-8*i+i==caseDest)  {direction=AVANT_DROITE;  if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                            if(caseSrc-8*i-i==caseDest)  {direction=AVANT_GAUCHE;  if (existeObstacle(pieceSrc,caseSrc,direction,caseDest,board)!=1) possible=1;}
                        }
                        break;
                    default : break;
                }
                return possible;
}

// deplacement
void deplacer(BOARD *board){
    // cmd c'est la commande écrite par l'utilisateur
    char cmd[4];
    // Savoir pour qui le tour
    char *tour = "";
    if (board->tour == BLANC) tour = "BLANC";
    else tour = "NOIR";
    printf("[ %s ] Commande: ",tour);
    scanf("%s",&cmd);
    // cmd du petit roque
    if (strcmp(cmd,"r")==0){
            if (board->tour==BLANC){
                // on vérife que les cases sont vides et le roque est possible
                if (board->roque[0]==0 && contenuCase(61,board)==Case_vide && contenuCase(62,board)==Case_vide ){
                    setBitTo1(&board->pieces[B_roi],62);
                    setBitTo0(&board->pieces[B_roi],60);
                    setBitTo1(&board->pieces[B_tours],61);
                    setBitTo0(&board->pieces[B_tours],63);
                    printf("\n petit roque \n");
                    changerTour(&board->tour);
                }else printf("\n petit roque Blanc impossible \n");
            }else{
                // on vérife que les cases sont vides et le roque est possible
                if (board->roque[2]==0 && contenuCase(5,board)==Case_vide && contenuCase(6,board)==Case_vide ){
                    setBitTo1(&board->pieces[N_roi],6);
                    setBitTo0(&board->pieces[N_roi],4);
                    setBitTo1(&board->pieces[N_tours],5);
                    setBitTo0(&board->pieces[N_tours],7);
                    printf("\n petit roque \n");
                    changerTour(&board->tour);
                }else printf("\n petit roque Noir impossible \n");
            }
            //-----------------------
            // mettre à jour le mot des pièces blanches
            board->piecesBlanc = board->pieces[B_pions] | board->pieces[B_tours] | board->pieces[B_cavaliers]
                                | board->pieces[B_fous] | board->pieces[B_dame] | board->pieces[B_roi];
            // mettre à jour le mot des pièces noires
            board->piecesNoir= board->pieces[N_pions] | board->pieces[N_tours] | board->pieces[N_cavaliers]
                                | board->pieces[N_fous] | board->pieces[N_dame] | board->pieces[N_roi];
            // mettre à jour le mot de tout les pièces
             board->toutPieces = board->piecesNoir | board->piecesBlanc;

    }
    else {
        if (strcmp(cmd,"R")==0){
                if (board->tour==BLANC){
                // on vérife que les cases sont vides et le roque est possible
                if (board->roque[1]==0 && contenuCase(57,board)==Case_vide && contenuCase(58,board)==Case_vide && contenuCase(59,board)==Case_vide ){
                    setBitTo1(&board->pieces[B_roi],58);
                    setBitTo0(&board->pieces[B_roi],60);
                    setBitTo1(&board->pieces[B_tours],59);
                    setBitTo0(&board->pieces[B_tours],56);
                    printf("\n grand roque \n");
                    changerTour(&board->tour);
                }else printf("\n grand roque Blanc impossible \n");
            }else{
                // on vérife que les cases sont vides et le roque est possible
                if (board->roque[3]==0 && contenuCase(1,board)==Case_vide && contenuCase(2,board)==Case_vide && contenuCase(3,board)==Case_vide ){
                    setBitTo1(&board->pieces[N_roi],2);
                    setBitTo0(&board->pieces[N_roi],4);
                    setBitTo1(&board->pieces[N_tours],3);
                    setBitTo0(&board->pieces[N_tours],0);
                    printf("\n grand roque \n");
                    changerTour(&board->tour);
                }else printf("\n grand roque Noir impossible \n");
            }
            //-----------------------
            // mettre à jour le mot des pièces blanches
            board->piecesBlanc = board->pieces[B_pions] | board->pieces[B_tours] | board->pieces[B_cavaliers]
                                | board->pieces[B_fous] | board->pieces[B_dame] | board->pieces[B_roi];
            // mettre à jour le mot des pièces noires
            board->piecesNoir= board->pieces[N_pions] | board->pieces[N_tours] | board->pieces[N_cavaliers]
                                | board->pieces[N_fous] | board->pieces[N_dame] | board->pieces[N_roi];
            // mettre à jour le mot de tout les pièces
             board->toutPieces = board->piecesNoir | board->piecesBlanc;
        }
        else{
                int positionSrc,positionDest;
                // la fonction separerCmd va convertir la chaine de caractère cmd
                //et va mettre les positions src et dest dans les deux variables positionSrc,positiondest;;
                separerCmd(cmd,&positionSrc,&positionDest);
                // on récupère ce qu'il y a dans la case src et dest
                int pieceSrc = contenuCase(positionSrc,board);
                int pieceDest = contenuCase(positionDest,board);
                // on vérifier si la case sélectionner n'est pas vide
                if (pieceSrc!=0){
                    // On vérifier si c'est la pièce du joueur en tour
                    if (pieceColor(pieceSrc)==board->tour){
                            // On vérifier si la case dest est pas plein avec une pièce de mm coleur
                        if(pieceColor(pieceSrc)==pieceColor(pieceDest)){
                            printf("\nMouvement impossible! : Case dest est plein de mm color\n");
                        }else{
                            if (!MouvementPossible(pieceSrc,positionSrc,pieceDest,positionDest,board)){
                                printf("\nMouvement impossible! : Mouvement errone\n");
                            }else{
                                // mettre à jour le mot de la piece courrante
                                setBitTo1(&board->pieces[pieceSrc],positionDest);
                                setBitTo0(&board->pieces[pieceSrc],positionSrc);
                                // tuer une piece si elle existe
                                if (pieceDest!=Case_vide) setBitTo0(&board->pieces[pieceDest],positionDest);
                                // roque impossible après le mouvement de la tour ou le roi
                                if (pieceSrc==B_roi){board->roque[0]=-1;board->roque[1]=-1;}
                                if (pieceSrc==N_roi){board->roque[2]=-1;board->roque[3]=-1;}
                                if (pieceSrc==B_tours){board->roque[0]=-1;board->roque[1]=-1;}
                                if (pieceSrc==N_tours){board->roque[2]=-1;board->roque[3]=-1;}
                                //-----------------------
                                // mettre à jour le mot des pièces blanches
                                board->piecesBlanc = board->pieces[B_pions] | board->pieces[B_tours] | board->pieces[B_cavaliers]
                                                    | board->pieces[B_fous] | board->pieces[B_dame] | board->pieces[B_roi];
                                // mettre à jour le mot des pièces noires
                                board->piecesNoir= board->pieces[N_pions] | board->pieces[N_tours] | board->pieces[N_cavaliers]
                                                    | board->pieces[N_fous] | board->pieces[N_dame] | board->pieces[N_roi];
                                // mettre à jour le mot de tout les pièces
                                 board->toutPieces = board->piecesNoir | board->piecesBlanc;
                                 changerTour(&board->tour);
                            }
                        }
                    }else printf("\n Mouvement impossible! : Ce n est pas votre piece \n");
                } else{
                    printf("\n Mouvement impossible! : Case source vide \n");
                }
        }
    }
}
