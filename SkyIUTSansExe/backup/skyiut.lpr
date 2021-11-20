program skyiut;

uses GestionEcran, unitPage, unitCombat, unitMagasin, unitInventaire, unitRace,
  unitSquelette, unitequipement, unitPersonnage, MMSystem, unitAlchimiste,
  unitForge, unitHeure, unitPrison;

var
  test: text;
  ligne:string;
  nom:string;

begin

  son(2,0);
  Logo;
  randomize;
  pageAccueil;
  readln;

end.
