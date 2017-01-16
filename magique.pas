program magique; //Le programme ne place pas les nombres suivants après 1 (que j'ai reussi a initialiser). Il y a doit y avoir un probleme avec i et j.

uses crt;

CONST
	MAX = 5;

TYPE
	Tab = array [1..MAX,1..MAX] of Integer;

procedure tableau(var T:Tab;compteur:integer);
VAR
	i, j : integer;
begin
 	for i:=1 to MAX do
 	begin
 	    for j:=1 to MAX do
	     begin
 	            T[i,j]:=0;
 	            T[MAX DIV 2,(MAX DIV 2) + 1]:=1;
 	    end;
 	end;
end;

procedure afficher(var T:Tab;compteur:integer);
VAR
	i, j, x, y : integer;
begin
	for i := 1 to MAX do
	begin
	  	for j := 1 to MAX do
	  	begin
	  			write(T[i,j]:2, ' ');
	  	end;
	  	writeln;
	end;
end;

procedure placer(var T:Tab;compteur:integer);
VAR
	i, j : integer;
	occupe : boolean;
begin
	IF T[i,j]=0 THEN
	begin
	  	T[i,j]:= compteur;
	  	T[i,j] := compteur + 1;
	end
	ELSE
	  	occupe:= true;
end;

procedure rechercheVide(var T:Tab;compteur:integer);
VAR
	i, j : integer;
begin
	IF i=0 THEN
	  	i:= MAX
	ELSE IF i=MAX+1 THEN
	  	i:= 1;

	IF j=0 THEN
	  	j:= MAX
	ELSE IF j=MAX+1 THEN
	  	j:= 1;
end;

procedure avancer(var T:Tab;compteur:integer);
VAR
	i, j : integer;
	occupe : boolean;
begin
	IF occupe= FALSE THEN
	begin
	   	i:= i-1;
	   	j:= j+1;
	end
	ELSE
	begin
	  	occupe:= FALSE;
	   	i:= i-1;
	   	j:= j-1;
	end;
end;

VAR
	i, j, compteur1 : integer;
	occupe : boolean;
	TableauInit : array [1..MAX,1..MAX] of Integer;

BEGIN
	occupe:= false;
	clrscr;
	writeln('Carre magique !');
	writeln;
	tableau(TableauInit,compteur1);
	FOR compteur1 := 1 TO MAX * MAX DO
	begin	
		avancer(TableauInit,compteur1);		
		rechercheVide(TableauInit,compteur1);
		placer(TableauInit,compteur1);	
	end;
	placer(TableauInit,compteur1);
	afficher(TableauInit,compteur1);

    readln;
END.

//BUT : Ecrire un algo qui affiche un carré magique de 5x5 ou 7x7 dont le numéro 1 est placé au nord du milieu de la table.
// On place les numéros par ordre croissant en allant du Nord-Est de la position courante. Si la place est déjà prise,
// on se déplace au Nord-Ouest jusqu'à trouver une place libre. Le tableau est considéré comme sphérique, c'est-à-dire
// que si l'on sort, on revient à la première colonne/ligne.
//ENTREE : Un tableau à 2 dimensions
//SORTIE : Le carré magique

// CONST MAX <- 5 : ENTIER

// TYPE
// 		Tab = Tableau[1..MAX,1..MAX] de ENTIER

// procedure tableau(var T:Tab ; compteur:ENTIER) //Cette procedure permet d'initialiser le tableau à 2 dimensions
// VAR
// 		i, j : ENTIER
// DEBUT
// 		POUR i <- 1 A MAX FAIRE
//			POUR j <- 1 A MAX FAIRE
//				T[i,j] <- 0
// 				T[MAX DIV 2,(MAX DIV 2) + 1] <- 1 //Ceci nous permet de garder la position du 1, c'est à dire au Nord du milieu de la table, quelque soit la taille du carré
//			FINPOUR
//		FINPOUR
// FINPROCEDURE

// procedure afficher(var T:Tab ; compteur:ENTIER) //Cette procedure permet d'afficher les numéros dans le tableau
// DEBUT
// 		POUR i <- 1 A MAX FAIRE		
// 			POUR j <- 1 A MAX FAIRE
// 				ECRIRE(T[i,j]:2, ' ') //Ceci permet de bien aligner les numéros par colonne
// 			FINPOUR
// 		FINPOUR
// FINPROCEDURE

// procedure placer(var T:Tab ; compteur:ENTIER) //Si la place suivante est égale à 0, alors on place le numéro suivant
// DEBUT	
// 		SI T[i,j]=0 ALORS		
// 			T[i,j] <- compteur
// 			compteur <- compteur + 1 - 1
// 		SINON
// 			occupe = VRAI
//		FINSI
// FINPROCEDURE

// procedure rechercheVide(var T:Tab ; compteur:ENTIER) //Si lors du deplacement on sort du tableau, alors cette procedure permet de replacer la position dans le tableau
// DEBUT
// 		SI i=0 ALORS
// 			i <- MAX
// 		SINON SI i=MAX+1 ALORS
// 			i <- 1
//		FINSI

// 		SI j=0 ALORS
// 			j <- MAX
// 		SINON SI j=MAX+1 ALORS
// 			j <- 1
//		FINSI
// FINPROCEDURE

// procedure avancer(var T:Tab ; compteur:ENTIER) //Occupe = faux quand il y un 0.On va donc se deplacer vers le Nord-Est. Si occupe est vrai alors on se deplacera vers le Nord-Ouest
// DEBUT	
//		SI occupe = FALSE ALORS
// 			i <- i-1
// 			j <- j+1
// 		SINON
// 			occupe = FAUX
// 			i <- i-1
// 			j <- j-1
// 		FINSI
// FINPROCEDURE

// -- Programme principal --

// DEBUT
// 		occupe = FAUX
// 		ECRIRE(''Carre magique !'')
// 		tableau; //Appelle de la procedure
// 		i <- (MAX DIV 2) + 1 //Ceci nous permet de garder la position du 1, c'est à dire au Nord du milieu de la table, quelque soit la taille du carré
// 		j <- MAX DIV 2

// 		POUR compteur1 DE 1 A MAX * MAX FAIRE compteur <= MAX * MAX FAIRE //Cette boucle permet de faire les verification nécessaire afin de placer correctement nos numéros par ordre croissant
// 			avancer
// 			rechercheVide
// 			placer
// 		FINPOUR
// 		afficher
// FIN
