unit unitRace;

{$codepage utf8}

interface

uses
  Classes, SysUtils, GestionEcran;
type
  perso = record
             nomPerso:string;
             racePerso:1..4;
             nomRacePerso:string;
             PDV: real;
             PDVMAX:integer;
             PM:0..500;
             gold:integer;
             end;
  moisTamrielien = record
             nom:(Primetoile,Clairciel,Semailles,Ondepluie,Plantaisons,Milan,Hautzenith,Vifazur,Atrefeu,Soufflegivre,Sombreciel,Soiretoile);
             nbjour:integer;
  end;


var
  personnage:perso;
  varDescriptif:integer;
  heure:integer;
  minute:integer;
  jour:integer;
  mois:moisTamrielien;
  annee:integer;
  xpAlchi,lvlAlchi:integer;
  xpForge,lvlForge:integer;


procedure squeletteRace;
procedure initialisation;
procedure temps(var tempsM,tempsH:integer);
procedure changerMois;
procedure mort;

implementation
 uses unitPage, unitCombat, unitSquelette,unitMagasin,unitInventaire,unitEquipement,unitAlchimiste;

procedure squeletteRace;
begin


  changerTailleConsole(150,45); //changer la taille de la console

  dessinerCadreXY(0,2,149,45,double,15,0);//Cadre contour console

  dessinerCadreXY(60,4,90,7,simple,15,0);

  deplacerCurseurXY(67,5);
  writeln('Création du hero');

  deplacerCurseurXY(12,12);// nom du joueur
  writeln('Choisir un nom pour votre personnage : ');
  deplacerCurseurXY(12,14);// race choisit
  writeln('Choisir une race pour votre personnage : ');


  dessinerCadreXY(10,16,140,20,simple,15,0);
  dessinerCadreXY(10,22,140,26,simple,15,0);
  dessinerCadreXY(10,28,140,32,simple,15,0);
  dessinerCadreXY(10,34,140,38,simple,15,0);

  deplacerCurseurXY(12,16);
  writeln(' 1 : Haut Elfe ');
  deplacerCurseurXY(12,17);
  writeln('Egalement appelés '' Altmers '' dans l''Archipel de l''automne dont ils sont originaires, les Hauts Elfes sont passés');
  deplacerCurseurXY(12,18);
  writeln('maitres en arts des arcanes, plus que tout autre race. Ils utilisent leur Pouvoir régalien pour régénérer');
  deplacerCurseurXY(12,19);
  writeln('rapidement leur magie.');

  deplacerCurseurXY(12,22);
  writeln(' 2 : Impérial ');
  deplacerCurseurXY(12,23);
  writeln('Natifs de Cyrodiil, ce sont souvent d''excellents diplomates et commerçants, à la fois doués pour le combat et la magie.');
  deplacerCurseurXY(12,24);
  writeln('Ils ont un sens de l''argent et des affaires inégalés et s''appuient sur la Voix de l''empereur pour calmer leurs ennemis.');

  deplacerCurseurXY(12,28);
  writeln(' 3 : Khajiit ');
  deplacerCurseurXY(12,29);
  writeln('Originaires de la province d''Elswey, ils sont intelligents, vifs et agiles. Leur capacité à agir en toute discretion fait');
  deplacerCurseurXY(12,30);
  writeln('d''eux d''excellents voleurs. Tous les Khajiits voient dans la nuit et se servent de leurs griffes pour attaquer.');

  deplacerCurseurXY(12,34);
  writeln(' 4 : Orque ');
  deplacerCurseurXY(12,35);
  writeln('Habitants des monts de Wrothgarian et la Queue de Dragon, les forgerons orques sont très célèbres pour la qualité');
  deplacerCurseurXY(12,36);
  writeln('de leurs créations. Les troupes orques equipées d’armures lourdes comptent parmi les meilleures de l''Empire et elles sont');
  deplacerCurseurXY(12,37);
  writeln('redoutables lorsqu''elles laissent éclater leur colère de berseker.');




  deplacerCurseurXY(51,12);
  readln(personnage.nomPerso);

  if personnage.nomPerso='El Pueblo' then son(5,0);


  deplacerCurseurXY(53,14);
  readln(personnage.racePerso);
  deplacerCurseurXY(67,7);




  initialisation;
  pageUN;
end;
procedure initialisation;// Permet d'initialiser les points de vie, points de mana et argent du joueur par rapport a chaque race
var i,w : integer;

begin
  for i := 0 to 9 do tabEpee[0,i]:='0';
  for i := 0 to 9 do tabArmure[0,i]:='0';
  for i := 0 to 10 do tabRessources[0,i]:='0';
   for i := 0 to 10 do tabPotions[0,i]:='0';

  for i := 0 to 9 do tabEpee[1,i]:='0';
  for i := 0 to 9 do tabArmure[1,i]:='0';
  for i := 0 to 10 do tabRessources[1,i]:='0';
  for i := 0 to 10 do tabPotions[1,i]:='0';
  caseInventaire := 0;   //initialise le compteur du tableau
  testesttestest:=0;
  case personnage.racePerso of
       1:begin
            personnage.PDV:=100;
            personnage.PDVMAX:=100;
            //personnage.PM:=100;
            personnage.nomRacePerso:='hautelfe';
            varDescriptif:=1;

       end;

       2:begin
            personnage.PDV:=100;
            personnage.PDVMAX:=100;
            //personnage.PM:=10;
            personnage.nomRacePerso:='impérial';
            varDescriptif:=2;
       end;

       3:begin
            personnage.PDV:=100;
            personnage.PDVMAX:=100;
            //personnage.PM:=100;
            personnage.nomRacePerso:='khajiit';
            varDescriptif:=3;
       end;

       4:begin
            personnage.PDV:=100;
            personnage.PDVMAX:=100;
            //personnage.PM:=90;
            personnage.nomRacePerso:='orque';
            varDescriptif:=4;
       end;

  end;

  //arme du debutant
  arme.nomArme:='Auncune arme';
  arme.degatArme:=500;//a changer??????????????????????????????????

  armure.nomArmure:='Aucune armure';
  armure.coefArmure := 1;
  attaquePerso1.nom:=arme.nomArme;
  attaquePerso1.degat:=arme.degatArme;

  attaquePerso2.nom:='coup de poing';
  attaquePerso2.degat:=10;


  if personnage.nomPerso='Simonet' then personnage.gold:=100000
  else personnage.gold:=100;

  heure:=14;
  minute:=14;
  jour:=14;
  mois.nom:=Primetoile;
  mois.nbjour:=31;
  annee:=497;

  xpAlchi:=0;
  xpForge:=0;
  lvlAlchi:=0;
  lvlForge:=0;

  if personnage.nomRacePerso='orque' then lvlForge:=1
  else lvlForge:=0;

  voirFemme:=FALSE;

end;

procedure changerMois;
begin
  mois.nom:=succ(mois.nom);

  case mois.nom of
       Primetoile:begin
                       mois.nbjour:=31;
                       annee:=annee+1;
                  end;
       Clairciel:mois.nbjour:=28;
       Semailles:mois.nbjour:=31;
       Ondepluie:mois.nbjour:=30;
       Plantaisons:mois.nbjour:=31;
       Milan:mois.nbjour:=30;
       Hautzenith:mois.nbjour:=31;
       Vifazur:mois.nbjour:=31;
       Atrefeu:mois.nbjour:=30;
       Soufflegivre:mois.nbjour:=31;
       Sombreciel:mois.nbjour:=30;
       Soiretoile:mois.nbjour:=31;
       end;
  jour:=1


  end;


procedure temps(var tempsM,tempsH:integer);
begin
  if minute+tempsM<60 then minute:=minute+tempsM
     else
       begin
         minute:=(minute+tempsM)-60;
         heure:=heure+1;
       end;
  if heure+tempsH<24 then heure:=heure+tempsH
     else
          begin
            heure:=(heure+tempsH)-24;
            jour:=jour+1;
          end;
  if jour > mois.nbjour then changerMois;

end;

procedure mort;
var
  i,j:integer;
  tempsM,tempsH:integer;
begin
  personnage.gold:=personnage.gold div 2;
  personnage.PDV:=100;
  tempsM:=30;
  tempsH:=5;
  temps(tempsM,tempsH);
  xpAlchi:=0;
  xpForge:=0;
  arme.nomArme:='Auncune arme';
  arme.degatArme:=5;

  for i := 0 to 9 do tabEpee[0,i]:='0';
  for i := 0 to 9 do tabArmure[0,i]:='0';
  for i := 0 to 10 do tabRessources[0,i]:='0';
   for i := 0 to 10 do tabPotions[0,i]:='0';

  for i := 0 to 9 do tabEpee[1,i]:='0';
  for i := 0 to 9 do tabArmure[1,i]:='0';
  for i := 0 to 10 do tabRessources[1,i]:='0';
  for i := 0 to 10 do tabPotions[1,i]:='0';

  for j:=2 to 30 do
  begin
  for i := 0 to 9 do tabEpee[j,i]:=' ';
  end;
  for j:=2 to 30 do
  begin
  for i := 0 to 9 do tabArmure[j,i]:=' ';

  end;
  for j:=2 to 30 do
  begin
  for i := 0 to 10 do tabRessources[j,i]:=' ';

  end;
  for j:=2 to 30 do
  begin
  for i := 0 to 10 do tabPotions[j,i]:=' ';

  end;

  squelette;
  deplacerCurseurXY(12,16);
  writeln('Vous etes mort, vous perdez la moitie de votre argent, ainsi que l''integralite de votre inventaire');
  attendre(3000);
  pageTaverne;




end;


end.

