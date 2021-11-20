unit unitCarte;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

procedure carte;
procedure afficheVille(ville:integer);

implementation

uses
  unitPage,unitSquelette,GestionEcran;


procedure carte;
begin

  squelette;
  menuPersonnage;

  afficheVille(positionVille);

  deplacerCurseurXY(20,10);
  writeln('Solitude');

  deplacerCurseurXY(27,14);
  writeln('Morthal');

  deplacerCurseurXY(80,11);
  writeln('Aubetoile');

  deplacerCurseurXY(120,11);
  writeln('Forthiver');

  deplacerCurseurXY(130,17);
  writeln('Vendeaume');

  deplacerCurseurXY(130,30);
  writeln('Falaise');

  deplacerCurseurXY(60,23);
  writeln('Blancherive');

  deplacerCurseurXY(40,33);
  writeln('Epervine');

  deplacerCurseurXY(5,23);
  writeln('Markarth');



  readln;

end;

procedure afficheVille(ville:integer);
begin

  case ville of
       1:dessinerCadreXY(59,22,71,24,simple,15,0);//Cadre Blancherive
       2:dessinerCadreXY(26,13,34,15,simple,15,0);//Cadre Morthal
       3:dessinerCadreXY(19,9,28,11,simple,15,0);//Cadre Solitude
       4:dessinerCadreXY(79,10,89,12,simple,15,0);//Cadre Aubetoile
       5:dessinerCadreXY(119,10,129,12,simple,15,0);//Cadre Forthiver
       6:dessinerCadreXY(129,16,139,18,simple,15,0);//Carte Vendeaume
       7:dessinerCadreXY(129,29,137,31,simple,15,0); //Carte Falaise
       8:dessinerCadreXY(39,32,48,34,simple,15,0); //Carte Epervine
       9:dessinerCadreXY(4,22,13,24,simple,15,0); //Carte Markarth

  end;




end;


end.

