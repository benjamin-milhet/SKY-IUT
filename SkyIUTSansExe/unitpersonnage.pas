unit unitPersonnage;

{$codepage utf8}

interface

uses
  Classes, SysUtils,GestionEcran;

procedure pagePersonnage;
procedure regain;

implementation
uses
  unitRace,unitCombat,unitMagasin,unitPage,unitInventaire,unitSquelette;

procedure pagePersonnage;



begin
  squelette;

  dessinerCadreXY(10,12,70,22,simple,15,0);//cadre personnage

  dessinerCadreXY(80,12,140,22,simple,15,0); //cadre caracteristiques

  dessinerCadreXY(10,26,140,34,simple,15,0);//cadre descriptifs

  deplacerCurseurXY(12,12);
  writeln(' Personnage : ');

  deplacerCurseurXY(14,14);// nom du joueur
  writeln('Nom : ', personnage.nomPerso);
  deplacerCurseurXY(14,16);//race du joueur
  writeln('Race : ', personnage.nomRacePerso);
  deplacerCurseurXY(14,18);//point de vie du joueur
  writeln('PDV : ', personnage.PDV:3:0);
  deplacerCurseurXY(14,20);//point de mana du joueur
  writeln('PM : ', personnage.PM);



  deplacerCurseurXY(82,12);
  writeln(' Caract',chr(130), 'ristiques : ');

  deplacerCurseurXY(12,26);
  writeln(' Descriptifs : ');

  case varDescriptif of
       1:begin
         deplacerCurseurXY(14,28);
         writeln('Egalement appeles '' Altmers '' dans l''Archipel de l''automne dont ils sont originaires, les Hauts Elfes sont passes');
         deplacerCurseurXY(14,30);
         writeln('maitres en arts des arcanes, plus que tout autre race. Ils utilisent leur Pouvoir regalien pour regenerer');
         deplacerCurseurXY(14,32);
         writeln('rapidement leur magie.');
       end;

       2:begin
         deplacerCurseurXY(14,29);
         writeln('Natifs de Cyrodiil, ce sont souvent d''excellents diplomates et commerçants, a la fois doues pour le combat et la magie.');
         deplacerCurseurXY(14,31);
         writeln('Ils ont un sens de l''argent et des affaires inegales et s''appuient sur la Voix de l''empereur pour calmer leurs ennemis.');
       end;

       3:begin
         deplacerCurseurXY(14,29);
         writeln('Originaires de la province d''Elswey, ils sont intelligents, vifs et agiles. Leur capacite a agir en toute discretion fait');
         deplacerCurseurXY(14,31);
         writeln('d''eux d''excellents voleurs. Tous les Khajiits voient dans la nuit et se servent de leurs griffes pour attaquer.');
       end;

       4:begin
         deplacerCurseurXY(14,28);
         writeln('Habitants des monts de Wrothgarian et la Queue de Dragon, les forgerons orques sont tres celebres pour la qualite');
         deplacerCurseurXY(14,30);
         writeln('de leurs creations. Les troupes orques equipees d’armures lourdes comptent parmi les meilleures de l''Empire et elles sont');
         deplacerCurseurXY(14,32);
         writeln('redoutables lorsqu''elles laissent eclater leur colere de berseker.');
       end;
  end;

  couleurFond(0);
  couleurTexte(15);
  deplacerCurseurXY(3,37);//Quitter la page fiche du personnage
  writeln('Taper 1 pour quitter cette page : ');
  deplacerCurseurXY(37,37);
  readln(conditionQuitter);

end;

procedure regain;
begin
  personnage.PDV:=personnage.PDVMAX;
end;

end.

