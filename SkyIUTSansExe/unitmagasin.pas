unit unitMagasin;

{$codepage utf8}

interface

uses
  Classes, SysUtils;

var
  caseInventaire,caseInventaire2,test : integer;
  bool : boolean;
  changeNom : string;



procedure magasin;               // Page acceuil magasin
procedure magasinEpee;           // page pour acheter des epees
procedure magasinArmure;         //page pour acheter des armures
procedure tableau;               //pour faire un tableau au milieu de l'ecran
function payer(var goldPerso,valeurPaiement:integer):boolean;//permet de verifier si assez de gold pour payer
procedure conditionAchatEpee(changeNom : string);
procedure conditionAchatArmure(changeNom : string);
procedure vendreEpee;
procedure vendreArmure;
{function vendre(var goldPerso:integer);}

implementation
  uses
    GestionEcran,unitPage,unitSquelette,unitInventaire,UnitRace,unitEquipement;

var
  valeurPaiement,goldPerso:integer;
  tempsH:integer;
  tempsM:integer;


procedure magasin;
  begin
    squelette;
    menuPersonnage;

    deplacerCurseurXY(12,12);
    writeln('Bien le bonjours voyageur !!');

    deplacerCurseurXY(12,15);
    writeln('J''ai des epees, des armures et plein d''autre truc !!!');







    deplacerCurseurXY(3,37);
    writeln('1/ Achetez une epee');

    deplacerCurseurXY(3,39);
    writeln('2/ Achetez un armure');

    deplacerCurseurXY(3,41);
    writeln('3/ Quittez la boutique');

    deplacerCurseurXY(40,37);
    writeln('4/ Vendre une epee');

    deplacerCurseurXY(40,39);
    writeln('5/ Vendre une armure');

    //deplacerCurseurXY(40,41);
    //writeln('1/ Achetez une epee');






    deplacerCurseurXY(12,33);//pos du curseur
    writeln('Choisir un numero pour realiser une action : ');
    deplacerCurseurXY(57,33);
    readln(choix);

    utiliseMenuPersonnage(choix);
    tempsH:=0;
    tempsM:=10;
    temps(tempsM,tempsH);
    case choix of
         '1': magasinEpee;
         '2':magasinArmure;
         '3':pageBlancherive;
         '4':vendreEpee;
         '5':vendreArmure;


    end;


  end;

procedure magasinEpee;                 // page pour acheter des epees
  begin
    squelette;
    menuPersonnage;

    deplacerCurseurXY(12,12);
    writeln('Vous voulez une epee !!!');

    deplacerCurseurXY(12,15);
    writeln('J''ai les meilleurs epee de la region !');

    tableau;
    deplacerCurseurXY(23,19);                // 1er
    writeln('Epee en acier');                //epee dans tableau
    deplacerCurseurXY(23,25);                //
    writeln('25 Pieces d''or');               //


    deplacerCurseurXY(50,19);                //2e
    writeln('Epee en argent');               //epee dans tableau
    deplacerCurseurXY(50,25);
    writeln('50 Pieces d''or');



    deplacerCurseurXY(77,19);                //3e
    writeln('Epee de l''enfant dragon');     //epee dans tableau
    deplacerCurseurXY(77,25);
    writeln('75 Pieces d''or');

    deplacerCurseurXY(109,19);               //4e
    writeln('Epee de ver dragon');           //epee dans tableau
    deplacerCurseurXY(109,25);
    writeln('100 Pieces d''or');




    deplacerCurseurXY(3,37);
    writeln('1/ Achetez une Epee en Acier');

    deplacerCurseurXY(3,39);
    writeln('2/ Achetez une Epee en Argent');

    deplacerCurseurXY(3,41);
    writeln('3/ Achetez l''Epee de l''Enfant dragon');

    deplacerCurseurXY(55,37);
    writeln('4/ Achetez une epee en ver dragon');

    deplacerCurseurXY(55,39);
    writeln('5/ Quittez la boutique');




    deplacerCurseurXY(12,33);//pos du curseur
    writeln('Choisir un numero pour realiser une action : ');
    deplacerCurseurXY(57,33);
    readln(choix);

    case choix of
         '1':begin
             valeurPaiement:=25;  //valeur a soustraire au gold du joueur
             changeNom := 'Epee en acier|' ;
             tabEpee[0,caseInventaire]:='1';
             tabEpee[1,caseInventaire]:='1'; //pour degat
             conditionAchatEpee(changeNom);


             end;

         '2':begin
             valeurPaiement:=50;      //meme principe que precedement
             changeNom := 'Epee en argent|';
             tabEpee[0,caseInventaire]:='1';
             tabEpee[1,caseInventaire]:='2';  //pour degat
             conditionAchatEpee(changeNom);


             end;

         '3':begin
             valeurPaiement:=75;       //meme principe que precedement
             changeNom := 'Epee de l''Enfant Dragon';
             tabEpee[0,caseInventaire]:='1';
             tabEpee[1,caseInventaire]:='3'; //pour degat
             conditionAchatEpee(changeNom);


             end;

         '4':begin
             valeurPaiement:=100;    //meme principe que precedement
             changeNom := 'Epee en ver dragon';
             tabEpee[0,caseInventaire]:='1';
             tabEpee[1,caseInventaire]:='4';  //pour degat
             conditionAchatEpee(changeNom);


             end;

         '5': begin
              magasin;

            end;
    end;

  end;

procedure vendreEpee;
  var i,j,k,m,choisir,vendu:integer;
    valeurVente:integer;
    test:char;
    test2,test3:string;
    maxTab:integer;
begin
  squelette;
  menuPersonnage;

  dessinerCadreXY(60,10,100,31,simple,15,0);
  deplacerCurseurXY(80,11);
  writeln('Epee');
  dessinerCadreXY(60,12,100,31,simple,15,0);
  dessinerCadreXY(56,12,60,31,simple,15,0);

  for  i := 1 to 10 do
  begin
       deplacerCurseurXY(58,12+i);
       writeln(i);
  end;



    for i := 0 to 9 do
    begin
              for j := 2 to 29 do
              begin
              deplacerCurseurXY(62+j,13+i);    //Affiche les épées du tableau
              writeln(tabEpee[j,i]);
              end;
    end;

    deplacerCurseurXY(5,38);
    writeln('Laquelle voulez vous vendre ?');
    test2:='                                ';

    for i := 0 to 9 do  if (tabEpee[0,i]='1') then maxTab:=i+1;  //donne la colonne max du tableau

    deplacerCurseurXY(36,38);
    readln(choisir);

    if (tabEpee[0,choisir-1]<>'0') then
    begin
    case tabEpee[1,choisir-1] of
         '1': begin
              valeurVente:=15;
              personnage.gold:= personnage.gold+valeurVente;
              end;
         '2': begin
              valeurVente:=35;
              personnage.gold:= personnage.gold+valeurVente;
              end;
         '3': begin
              valeurVente:=55;
              personnage.gold:= personnage.gold+valeurVente;
              end;
         '4': begin
              valeurVente:=75;
              personnage.gold:= personnage.gold+valeurVente;
              end;
    end;

    vendu:=choisir;
    j:=1;
    test3:='                        ';
    for k := 2 to 25 do
    begin
         test:=tabEpee[k,vendu-1];     //rentre valeur ligne dans test3
         test3[j]:=test;             //pour afficher ce que ta vendu
         j:=j+1;                     //
    end;



    vendu:=vendu-1; //met vendu à la valeur du tableau cat tableau commence a 0
    for i := 1 to length(test2) do       //
    begin                                //
         tabEpee[i,vendu] := ' ';    //supprime l'épée a la ligne choisie
    end;


    for m := 0 to ((maxTab-choisir)) do //peut-etre le probleme la condition ????
    begin

    j:=1;
    for k := 1 to 25 do
    begin
         if (maxTab=vendu+1) then
         begin
         test:=tabEpee[k,vendu];     //rentre valeur ligne+1 dans test2
         test2[j]:=test;             //
         j:=j+1;
         end
         else
         begin
         test:=tabEpee[k,vendu+1];     //rentre valeur ligne+1 dans test2
         test2[j]:=test;             //
         j:=j+1;                     //
         end;
    end;

    if (maxTab=vendu+1) then
         for i := 1 to 25 do tabEpee[i,vendu] := ' '    //supprime l'épée n+1
    else
        for i := 1 to 25 do tabEpee[i,vendu+1] := ' ';

    for i := 1 to 25 do       //
    begin                                //
         tabEpee[i,vendu+1] := ' ';    //supprime l'épée n+1
    end;

    for i := 1 to 25 do tabEpee[i,vendu] := test2[i];

    vendu:=vendu+1;
    end;             /////////////////////////////////

    tabEpee[0,maxTab-1]:='0';
    tabEpee[1,maxTab-1]:='0';
    caseInventaire:=caseInventaire-1;

    for i := 0 to 9 do
    begin
              for j := 2 to 29 do
              begin
              deplacerCurseurXY(62+j,13+i);    //Affiche les épées du tableau
              writeln(tabEpee[j,i]);
              end;
    end;




    deplacerCurseurXY(5,15);
    writeln('Vous avez vendu : ');
    deplacerCurseurXY(5,16);
    writeln(test3);
    deplacerCurseurXY(5,17);
    writeln('pour ',valeurVente,' Septim');
    readln;
    magasin;
    end

    else
    begin
    deplacerCurseurXY(5,15);
    writeln('Vous n''avez rien vendu');
    readln;
    magasin;

    end;

end;

procedure conditionAchatEpee(changeNom : string);
var
  i:integer;
  //posArme:string;
begin
  if ((tabArmure[0,9]='1') OR (tabEpee[0,9]='1')) then
  begin
  squelette;
    menuPersonnage;
    dessinerCadreXY(15,17,129,31,double,15,0);       //on dessine un cadre
    deplacerCurseurXY(75,19);
    writeln('Vous n''avez plus de place dans l''inventaire');
    attendre(900);

end
else
begin
             goldPerso := personnage.gold;
             bool := payer(goldPerso,valeurPaiement);   //fonction qui renvoie vrai si joueur peut payer

             if(bool) then                            //si le joueur peut payer
             begin

             for i := 1 to length(changeNom) do tabEpee[i+1,caseInventaire] := changeNom[i];

             personnage.gold := personnage.gold-valeurPaiement;   //joueur perd 25 gold
             caseInventaire := caseInventaire+1;      //change la case du tableau
             capaciteInventaire:= capaciteInventaire+1;
             magasinEpee;
             end
             else magasinEpee;

end;

end;

procedure magasinArmure;              //page pour acheter des armures
begin
  squelette;
  menuPersonnage;

  deplacerCurseurXY(12,12);
  writeln('Vous voulez une armure !!!');


    tableau;
    deplacerCurseurXY(23,19);                // 1er
    writeln('Armure en acier');                //epee dans tableau
    deplacerCurseurXY(23,25);                //
    writeln('25 Pieces d''or');               //


    deplacerCurseurXY(50,19);                //2e
    writeln('Armure en argent');               //epee dans tableau
    deplacerCurseurXY(50,25);
    writeln('50 Pieces d''or');



    deplacerCurseurXY(77,19);                //3e
    writeln('Armure de l''enfant dragon');     //epee dans tableau
    deplacerCurseurXY(77,25);
    writeln('75 Pieces d''or');

    deplacerCurseurXY(109,19);               //4e
    writeln('Armure en ver dragon');           //epee dans tableau
    deplacerCurseurXY(109,25);
    writeln('100 Pieces d''or');



    deplacerCurseurXY(3,37);
    writeln('1/ Achetez une armure en Acier');

    deplacerCurseurXY(3,39);
    writeln('2/ Achetez une armure en Argent');

    deplacerCurseurXY(3,41);
    writeln('3/ Achetez armure de l''Enfant dragon');

    deplacerCurseurXY(55,37);
    writeln('4/ Achetez une armure en Ver dragon');

    deplacerCurseurXY(55,39);
    writeln('5/ Quittez la boutique');

    deplacerCurseurXY(12,33);//pos du curseur
    writeln('Choisir un numero pour realiser une action : ');
    deplacerCurseurXY(57,33);
    readln(choix);

    case choix of
         '1':begin
             valeurPaiement:=25;      //valeur a soustraire au gold du joueur
             changeNom := 'Armure en acier|';
             tabArmure[0,caseInventaire2]:='1';
             tabArmure[1,caseInventaire2]:='1';
             conditionAchatArmure(changeNom);


             end;

         '2':begin
             valeurPaiement:=50;      //meme principe que precedement
             changeNom := 'Armure en argent|';
             tabArmure[0,caseInventaire2]:='1';
             tabArmure[1,caseInventaire2]:='2';
             conditionAchatArmure(changeNom);


             end;

         '3':begin
             valeurPaiement:=75;       //meme principe que precedement
             changeNom := 'Armure de l''Enfant Dragon' ;
             tabArmure[0,caseInventaire2]:='1';
             tabArmure[1,caseInventaire2]:='3';
             conditionAchatArmure(changeNom);


             end;

         '4':begin
             valeurPaiement:=100;    //meme principe que precedement
             changeNom := 'Armure de Ver Dragon';
             tabArmure[0,caseInventaire2]:='1';
             tabArmure[1,caseInventaire2]:='4';
             conditionAchatArmure(changeNom);


             end;

         '5': begin
              magasin;

            end;
    end;





end;

procedure vendreArmure;
  var i,j,k,m,choisir,vendu:integer;
    valeurVente:integer;
    test:char;
    test2,test3:string;
    maxTab:integer;
begin
  squelette;
  menuPersonnage;

  dessinerCadreXY(60,10,100,31,simple,15,0);
  deplacerCurseurXY(80,11);
  writeln('Armure');
  dessinerCadreXY(60,12,100,31,simple,15,0);
  dessinerCadreXY(56,12,60,31,simple,15,0);

  for  i := 1 to 10 do
  begin
       deplacerCurseurXY(58,12+i);
       writeln(i);
  end;



    for i := 0 to 9 do
    begin
              for j := 0 to 28 do
              begin
              deplacerCurseurXY(62+j,13+i);    //Affiche les épées du tableau
              writeln(tabArmure[j,i]);
              end;
    end;

    deplacerCurseurXY(5,38);
    writeln('Laquelle voulez vous vendre ?');
    test2:='                               ';

    for i := 0 to 9 do  if (tabArmure[0,i]='1') then maxTab:=i+1;  //donne la colonne max du tableau

    deplacerCurseurXY(36,38);
    readln(choisir);


    if (tabArmure[0,choisir-1]<>'0') then
    begin
    case tabArmure[1,choisir-1] of
         '1': begin
              valeurVente:=15;
              personnage.gold:= personnage.gold+valeurVente;
              end;
         '2': begin
              valeurVente:=35;
              personnage.gold:= personnage.gold+valeurVente;
              end;
         '3': begin
              valeurVente:=55;
              personnage.gold:= personnage.gold+valeurVente;
              end;
         '4': begin
              valeurVente:=75;
              personnage.gold:= personnage.gold+valeurVente;
              end;
    end;


    vendu:=choisir;
    j:=1;
    test3:='                              ';
    for k := 2 to 28 do
    begin
         test:=tabArmure[k,vendu-1];     //rentre valeur ligne dans test3
         test3[j]:=test;             //pour afficher ce que ta vendu
         j:=j+1;                     //
    end;



    vendu:=vendu-1; //met vendu à la valeur du tableau cat tableau commence a 0
    for i := 1 to length(test2) do       //
    begin                                //
         tabArmure[i,vendu] := ' ';    //supprime l'épée a la ligne choisie
    end;


    for m := 0 to ((maxTab-choisir)) do
    begin

    j:=1;
    for k := 1 to 29 do
    begin
         if (maxTab=vendu+1) then
         begin
         test:=tabArmure[k,vendu];     //rentre valeur ligne+1 dans test2
         test2[j]:=test;             //
         j:=j+1;
         end
         else
         begin
         test:=tabArmure[k,vendu+1];     //rentre valeur ligne+1 dans test2
         test2[j]:=test;             //
         j:=j+1;                     //
         end;
    end;

    if (maxTab=vendu+1) then
         for i := 1 to 29 do tabArmure[i,vendu] := ' '    //supprime l'épée n+1
    else
        for i := 1 to 29 do tabArmure[i,vendu+1] := ' ';

    //for i := 1 to 29 do       //
    //begin                                //
   //      tabArmure[i,vendu+1] := ' ';    //supprime l'épée n+1
   // end;

    for i := 1 to 29 do tabArmure[i,vendu] := test2[i];

    vendu:=vendu+1;
    end;             /////////////////////////////////

    tabArmure[0,maxTab-1]:='0';
    tabArmure[1,maxTab-1]:='0';
    //tabArmure[0,maxTab]:='0';
    caseInventaire2:=caseInventaire2-1;

    for i := 0 to 9 do
    begin
              for j := 0 to 29 do
              begin
              deplacerCurseurXY(62+j,13+i);    //Affiche les épées du tableau
              writeln(tabArmure[j,i]);
              end;
    end;




    deplacerCurseurXY(5,15);
    writeln('Vous avez vendu : ');
    deplacerCurseurXY(5,16);
    writeln(test3);
    deplacerCurseurXY(5,17);
    writeln('pour ',valeurVente,' Septim');
    readln;
    magasin;

    end
    else
    begin
    deplacerCurseurXY(5,15);
    writeln('Vous n''avez rien vendu');
    readln;
    magasin;

    end;

end;

procedure conditionAchatArmure(changeNom : string);
var
  i:integer;
begin
  if ((tabArmure[0,9]='1') OR (tabEpee[0,9]='1')) then
  begin
  squelette;
    menuPersonnage;
    dessinerCadreXY(15,17,129,31,double,15,0);       //on dessine un cadre
    deplacerCurseurXY(75,19);
    writeln('Vous n''avez plus de place dans l''inventaire');
    attendre(900);
end
else
begin
             goldPerso := personnage.gold;
             bool := payer(goldPerso,valeurPaiement);   //fonction qui renvoie vrai si joueur peut payer

             if(bool) then                            //si le joueur peut payer
             begin

             for i := 1 to length(changeNom) do tabArmure[i+1,caseInventaire2] := changeNom[i];

             personnage.gold := personnage.gold-valeurPaiement;   //joueur perd 25 gold
             caseInventaire2 := caseInventaire2+1;      //change la case du tableau
             capaciteInventaire:= capaciteInventaire+1;
             magasinArmure;
             end
             else magasinArmure;

end;

end;

procedure tableau;                    //pour faire un tableau au milieu de l'ecran
begin
  dessinerCadreXY(15,17,129,31,simple,15,0);   //cadre exterieur

    dessinerCadreXY(43,17,129,31,simple,15,0);      //premiere colonne

    dessinerCadreXY(72,17,129,31,simple,15,0);      //deuxieme colonne

    dessinerCadreXY(101,17,129,31,simple,15,0);

    dessinerCadreXY(15,21,129,21,simple,15,0);      //fait la séparation haut/bas
end;

function payer(var goldPerso,valeurPaiement:integer):boolean;//permet de verifier si assez de gold pour payer
begin



       if ((goldPerso-valeurPaiement)<0) then    //si les gold du joueur<gold achat
  begin
    squelette;
    menuPersonnage;
    dessinerCadreXY(15,17,129,31,double,15,0);       //on dessine un cadre
    deplacerCurseurXY(75,19);
    writeln('Vous n''avez pas assez d''argent !!!!');  //contenu du cadre
    payer:=FALSE;                                      //fonction renvoie faux
    attendre(900);
  end
  else                                               //sinon
  begin
    son(7,0);
    squelette;
    menuPersonnage;
    dessinerCadreXY(15,17,129,31,double,15,0);
    deplacerCurseurXY(75,19);
    writeln('Equipement acheter !');                //contenu du cadre
    payer:=TRUE;                                    //fonction renvoie vrai
    attendre(900);
  end;



end;


end.
