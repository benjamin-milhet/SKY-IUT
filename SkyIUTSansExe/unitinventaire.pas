unit unitInventaire;

{$codepage utf8}

interface

uses
  Classes, SysUtils;

var          //horizontale//verticale(je crois)
    tabEpee : array[0..30,0..9] of char;
    tabArmure : array[0..30,0..9] of char;
    tabEquipement : array[0..30,0..10] of char;
    capaciteInventaire:integer;


procedure Inventaire;
procedure InventaireEpee;
procedure InventaireArmure;
procedure AttributDegat;
procedure AttributResistance;

implementation
uses
  GestionEcran,unitPage, unitMagasin,unitSquelette,unitEquipement,unitRace,unitCombat;

 var
         choisir:integer;



procedure Inventaire;      //pour l'instant affiche l'inventaire du joueur jusqu'a 10
var i,j,k,m:integer;
begin
  squelette;
  menuPersonnage;

    dessinerCadreXY(40,10,80,31,simple,15,0);
    deplacerCurseurXY(58,11);
    writeln('Epee');
    dessinerCadreXY(40,12,80,31,simple,15,0);



    dessinerCadreXY(90,10,130,31,simple,15,0);
    deplacerCurseurXY(108,11);
    writeln('Armure');
    dessinerCadreXY(90,12,130,31,simple,15,0);

    deplacerCurseurXY(5,20);
    writeln('Capacite inventaire ',capaciteInventaire,'/10');

    //k:=0;
    m:=0;
    for i := 0 to 9 do
    begin
              for j := 0 to 29 do
              begin
              deplacerCurseurXY(42+j,13+i);
              writeln(tabEpee[j,i]);
              end;


    end;

    for i := 0 to 9 do
    begin
              for j := 0 to 29 do
              begin
              deplacerCurseurXY(92+j,13+i);
              writeln(tabArmure[j,i]);
              end;

    end;


  deplacerCurseurXY(3,37);
  writeln('1/ Equiper une epee');

  deplacerCurseurXY(3,39);
  writeln('2/ Equiper une armure');

  deplacerCurseurXY(3,41);
  writeln('3/ Quittez l''inventaire');

  deplacerCurseurXY(12,33);//pos du curseur
  writeln('Choisir un numero pour realiser une action : ');
  deplacerCurseurXY(57,33);

  readln(conditionQuitter);
  //if (conditionQuitter = '1') then magasin;

  case conditionQuitter of
         '1':begin
             InventaireEpee;

             end;

         '2':begin
             InventaireArmure;

             end;


    end;
  while conditionQuitter<>'3' do
  begin
       utiliseMenuPersonnage(choix);
       Inventaire;

  end






end;

procedure InventaireEpee;
var i,j,k:integer;

    test:char;
    test2:string;
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
              deplacerCurseurXY(62+j,13+i);
              writeln(tabEpee[j,i]);
              end;
    end;

    deplacerCurseurXY(5,38);
    writeln('Laquelle voulez vous equiper ?');
    test2:='                    ';
    deplacerCurseurXY(36,38);
    readln(choisir);


    if (tabEpee[0,choisir-1]<>'0') then
    begin
    son(9,0);
    j:=0;

    for k := 1 to length(test2) do
    begin
         test:=tabEpee[k,choisir-1];
         test2[j]:=test;
         j:=j+1;
    end;

    arme.nomArme := test2;
    AttributDegat;

    attaquePerso1.nom:=arme.nomArme;
    attaquePerso1.degat:=arme.degatArme;

    deplacerCurseurXY(5,16);
    writeln(arme.nomArme);
    deplacerCurseurXY(5,17);
    writeln(arme.degatArme);
    readln;

    Inventaire;
    end
    else
    begin
    deplacerCurseurXY(5,15);
    writeln('Vous n''avez rien équiper');
    readln;
    Inventaire;
    end;

end;

procedure AttributDegat;
begin
  if (tabEpee[1,choisir-1] ='1') then arme.degatArme := 10
  else if (tabEpee[1,choisir-1]) ='2' then arme.degatArme := 20
  else if (tabEpee[1,choisir-1]) ='3' then arme.degatArme := 40
  else if (tabEpee[1,choisir-1]) ='4' then arme.degatArme := 80;
end;

procedure InventaireArmure;
var i,j,k:integer;

    test:char;
    test2:string;
begin
  squelette;
  menuPersonnage;

  dessinerCadreXY(60,10,100,31,simple,15,0);
  deplacerCurseurXY(80,11);
  writeln('Armure');
  dessinerCadreXY(60,12,100,31,simple,15,0);
  dessinerCadreXY(56,12,60,31,simple,15,0);

  for  i := 1 to 9 do
  begin
       deplacerCurseurXY(58,12+i);
       writeln(i);
  end;



    for i := 0 to 9 do
    begin
              for j := 2 to 29 do
              begin
              deplacerCurseurXY(62+j,13+i);
              writeln(tabArmure[j,i]);
              end;
    end;

    deplacerCurseurXY(5,38);
    writeln('Laquelle voulez vous equiper ?');
    test2:='                            ';
    deplacerCurseurXY(36,38);
    readln(choisir);


    if (tabArmure[0,choisir-1]<>'0') then
    begin
    son(10,0);
    j:=0;

    for k := 1 to length(test2) do
    begin
         test:=tabArmure[k,choisir-1];
         test2[j]:=test;
         j:=j+1;
    end;

    armure.nomArmure := test2;
    AttributResistance;

    deplacerCurseurXY(5,16);
    writeln(armure.nomArmure);
    deplacerCurseurXY(5,17);
    writeln(armure.coefArmure:1:1);
    readln;

    Inventaire;
    end
    else
    begin
    deplacerCurseurXY(5,15);
    writeln('Vous n''avez rien équiper');
    readln;
    Inventaire;
    end;


end;

procedure AttributResistance;
begin
  if (tabArmure[1,choisir-1] ='1') then armure.coefArmure := 0.9
  else if (tabArmure[1,choisir-1]) ='2' then armure.coefArmure := 0.8
  else if (tabArmure[1,choisir-1]) ='3' then armure.coefArmure := 0.6
  else if (tabArmure[1,choisir-1]) ='4' then armure.coefArmure := 0.5;
end;

end.

