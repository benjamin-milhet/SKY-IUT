unit unitEquipement;

{$codepage utf8}

interface

uses
  Classes, SysUtils,GestionEcran;
var
  tabEquipement : array[0..30,0..10] of char;


type
  armePerso = record
    nomArme:string;
    degatArme:integer;
    //pos:integer;
    //catArme:integer;
  end;

  armurePerso = record
    nomArmure:string;
    coefArmure:real;
    //pos:integer;
    //catArmure:integer;
  end;

  var
    arme:armePerso;
    armure:armurePerso;

procedure pageEquipement;

implementation
uses
  unitRace,unitCombat,unitMagasin,unitPage,unitInventaire,unitSquelette;



procedure pageEquipement;
begin
  squelette;
  menuPersonnage;



  dessinerCadreXY(10,15,70,25,simple,15,0);
  dessinerCadreXY(10,17,70,25,simple,15,0);
  deplacerCurseurXY(35,16);
  writeln(arme.nomArme);
  deplacerCurseurXY(12,20);
  writeln('Degats : ',arme.degatArme);


  dessinerCadreXY(80,15,140,25,simple,15,0);
  dessinerCadreXY(80,17,140,25,simple,15,0);
  deplacerCurseurXY(110,16);
  writeln(armure.nomArmure);
  deplacerCurseurXY(82,20);
  writeln('Resistance : ',armure.coefArmure:1:1);










  deplacerCurseurXY(3,37);//Quitter la page fiche du personnage
  writeln('Taper 1 pour quitter cette page : ');
  deplacerCurseurXY(37,37);
  readln(conditionQuitter);
end;

end.

