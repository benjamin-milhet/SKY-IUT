unit unitSquelette;

{$codepage utf8}

interface

uses
  Classes, SysUtils,GestionEcran;

type


  monster = record
             nomM:string;
             PDV:real;
             PM:0..500;
             typeM:string;
             end;

      attaqueM = record
          nom:string;
          degat:real;
          end;
var
  conditionQuitter:string;

procedure squelette;
procedure squeletteCombat(monstre:monster);
procedure cadreAction;
procedure menuPersonnage;
procedure utiliseMenuPersonnage(choix:string);
procedure squelettePage;

implementation
uses
  unitRace, unitCombat,unitPage,unitPersonnage, unitEquipement,unitInventaire,unitQuete,unitAlchimiste,unitCarte,unitPrison;


procedure squelette; // base du programme
var
  i:integer;

begin
  //Debut squellette algo
  effacerEcran;
  changerTailleConsole(150,45); //changer la taille de la console

  dessinerCadreXY(0,0,149,37,double,15,0);//Cadre contour console
  dessinerCadreXY(101,1,149,8,double,15,0);//cadre pour lieux,date et menu
  dessinerCadreXY(0,1,40,8,double,15,0);//cadre pour nom, race, pdv et gold
  dessinerCadreXY(41,1,100,8,double,15,0);//cadre pour les niveaux d'experience
  dessinerCadreXY(0,37,100,44,double,15,0);//care bas action
  dessinerCadreXY(101,37,149,44,double,15,0);//cadre bas menu

  //Ajouter des variable d'uniter a ces 5 categories
  deplacerCurseurXY(4,1);// nom du joueur
  writeln('Nom : ', personnage.nomPerso);
  deplacerCurseurXY(4,2);//race du joueur
  writeln('Race : ', personnage.nomRacePerso);
  deplacerCurseurXY(4,4);//point de vie du joueur
  writeln('PDV : ', personnage.PDV:1:1);
  deplacerCurseurXY(4,5);//point de mana du joueur
  writeln('PM : ', personnage.PM);
  deplacerCurseurXY(4,6);//Argent du joueur
  writeln('Gold : ', personnage.gold);


  deplacerCurseurXY(103,1);//Lieu actuel
  writeln('Lieu : ', position);
  deplacerCurseurXY(103,3);//heure
  if minute<10 then
  writeln('Heure : ',heure,':0',minute)
  else writeln('Heure : ',heure,':',minute);


  deplacerCurseurXY(103,5);//date
  writeln('Date : ',jour,', ',mois.nom,', ',annee);


  deplacerCurseurXY(48,1);
  writeln('LVL Alchimiste : ', lvlAlchi+1);

  dessinerCadreXY(46,2,66,4,double,15,0);//cadre bas menu
  couleurFond(15);
  for i:=1 to xpAlchi*2 do
      begin
           deplacerCurseurXY(46+i,3);//Lieu actuel
           writeln(' ');

      end;

  couleurFond(0);
  if xpAlchi >= 10 then
  begin
    xpAlchi:=0;
    lvlAlchi:=lvlAlchi+1;
  end;



  deplacerCurseurXY(77,1);
  writeln('LVL Forgeron : ', lvlForge+1);

  dessinerCadreXY(75,2,95,4,double,15,0);//cadre bas menu
  couleurFond(15);
  for i:=1 to xpForge*2 do
      begin
           deplacerCurseurXY(75+i,3);//Lieu actuel
           writeln(' ');

      end;

  couleurFond(0);
  if xpForge >= 10 then
  begin
    xpForge:=0;
    lvlForge:=lvlForge+1;
  end;



  //Fin squellette algo
end;

procedure squeletteCombat(monstre:monster);


begin

  //effacerEcran;
  effacerEtColorierEcran(15);


   //partie magie
  dessinerCadreXY(0,42,90,44,simple,15,0); //cadre attaque
  deplacerCurseurXY(3,43);
  writeln('3/ Potions');

  {dessinerCadreXY(46,42,90,44,simple,15,0); //cadre attaque
  deplacerCurseurXY(49,43);
  writeln('4/ ', attaquePerso4.nom);}

  dessinerCadreXY(0,39,45,41,simple,15,0); //cadre attaque
  deplacerCurseurXY(3,40);
  writeln('1/ ', attaquePerso1.nom);

  dessinerCadreXY(46,39,90,41,simple,15,0); //cadre attaque
  deplacerCurseurXY(49,40);
  writeln('2/ ', attaquePerso2.nom);


  dessinerCadreXY(91,39,149,44,simple,15,0); //cadre action
  deplacerCurseurXY(100,40);
  writeln('Choisir un numéro pour une attaque : ');



  //debut cadre heros

  dessinerCadreXY(95,32,130,34,simple,0,15);

  deplacerCurseurXY(97,32);
  writeln(' ', personnage.nomPerso, ' ');

  deplacerCurseurXY(100,33);
  writeln('PDV : ', personnage.PDV:1:1);

  deplacerCurseurXY(120,33);
  writeln('PM : ', personnage.PM);
  //fin cadre heros

  //debut cadre monstre


  dessinerCadreXY(20,5,55,7,simple,0,15);

  deplacerCurseurXY(22,5);
  writeln(' ', monstre.nomM, ' ');

  deplacerCurseurXY(25,6);
  writeln('PDV : ', monstre.PDV:3:0);

  deplacerCurseurXY(45,6);
  writeln('PM : ', monstre.PM);
  //fin cadre monstre

  cadreAction;






end;
procedure cadreAction;
begin
    //debut cadre action
  dessinerCadreXY(10,32,75,34,simple,0,15);

  deplacerCurseurXY(12,32);
  writeln(' Action : ');
  //fin cadre action
end;

procedure menuPersonnage;
begin

  deplacerCurseurXY(105,37);
  writeln('M1/ Personnage');

  deplacerCurseurXY(105,39);
  writeln('M2/ Equipement');

  deplacerCurseurXY(105,41);
  writeln('M3/ Carte');

  deplacerCurseurXY(130,37);
  writeln('M4/ Inventaire ');

  deplacerCurseurXY(130,39);
  writeln('M5/ Quêtes');

  deplacerCurseurXY(130,41);
  writeln('M6/ Sac a potions');



end;

procedure utiliseMenuPersonnage(choix:string);// procedure pour faire les choix au niveau de personnage
var
  valeurRandom:monster;
  tempsH,tempsM:integer;
begin
  tempsH:=0;
  tempsM:=5;
  temps(tempsM,tempsH);
  case choix of
       'M1': pagePersonnage;         //va sur page personnage

       'M2':begin
            pageEquipement;          //va sur page equipement

            end;
       'M3':carte;

       'M4':begin
            inventaire;              //va sur page inventaire
            end;
       'M5':begin                    //va sur page quete
            quete;

            end;

       'M6':begin                    //va sur page sac a potion

            Sac(valeurRandom);

            end;
       end;
  end;

procedure squelettePage;
begin

  squelette;
  menuPersonnage;
  deplacerCurseurXY(12,12);
  writeln(Texte1);

  deplacerCurseurXY(12,13);
  writeln(Texte2);

  deplacerCurseurXY(12,14);
  writeln(Texte3);

  deplacerCurseurXY(12,15);
  writeln(Texte4);

  deplacerCurseurXY(12,16);
  writeln(Texte5);

  deplacerCurseurXY(2,37);
  writeln(rep1);

  deplacerCurseurXY(2,39);
  writeln(rep2);

  deplacerCurseurXY(2,41);
  writeln(rep3);

  deplacerCurseurXY(45,37);
  writeln(rep4);

  deplacerCurseurXY(45,39);
  writeln(rep5);

  deplacerCurseurXY(45,41);
  writeln(rep6);

  deplacerCurseurXY(12,33);//pos du curseur
  writeln('Choisir un numéro pour réaliser une action : ');
  deplacerCurseurXY(57,33);
  readln(choix);


  conditionQuitter:=' ';





end;
end.

