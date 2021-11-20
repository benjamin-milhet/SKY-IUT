unit unitQuete;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,GestionEcran;

procedure quete;
Procedure QueteDragon;

var
  nomQuete:string;
  conditonQueteDragon:boolean;

implementation
uses
  unitRace,unitCombat,unitMagasin,unitPage,unitInventaire,unitSquelette;

procedure quete;
begin
  squelette;
  menuPersonnage;                  //juste affiche le squelette

  dessinerCadreXY(60,10,90,13,simple,15,0);

  deplacerCurseurXY(73,11);
  writeln('Quetes');


  if conditonQueteDragon=TRUE then QueteDragon;

  deplacerCurseurXY(3,37);//Quitter la page fiche du personnage
  writeln('Taper 1 pour quitter cette page : ');
  deplacerCurseurXY(37,37);
  readln(conditionQuitter);


end;

Procedure QueteDragon;
begin
  nomQuete:='La chasse au dragon';
  dessinerCadreXY(20,12,130,16,simple,15,0);//cadre quete1

  deplacerCurseurXY(22,12);
  writeln(' La chasse au dragon : ');

end;

end.

