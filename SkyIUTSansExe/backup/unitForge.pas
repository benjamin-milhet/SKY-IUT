unit unitForge;

{$codepage utf8}

interface

uses
  Classes, SysUtils, unitSquelette;


procedure pageForge;
procedure pageEpee;
procedure pageAmeEpee;
procedure pageArmure;
procedure pageCraftE1;
procedure pageCraftEA1;
procedure pageCraftE2;
procedure pageCraftE3;
procedure pageCraftA1;
procedure pageCraftA2;
procedure pageCraftA3;
procedure epeeAcier(objetV1,objetV2:string);
procedure epeeArgent(objetV1,objetV2:string);
procedure epeeDragon(objetV1,objetV2:string);
procedure armureAcier(objetV1,objetV2:string);
procedure armureArgent(objetV1,objetV2:string);
procedure armureDragon(objetV1,objetV2:string);
function videEpee():string;
procedure epeeArgentAme(objetV1,objetV2:string);
procedure epeeAcierAme(objetV1,objetV2:string);



implementation

uses GestionEcran,unitPage,unitInventaire,unitCombat,unitRace,unitAlchimiste,unitMagasin;

procedure pageForge;
begin


  position:='Forge de Forthiver';
  texte1:='Bienvenue dans la plus grande forge du royaume';
  texte2:='';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Fabriquer une arme';
  rep2:='2/ Fabriquer une armure';
  rep3:='3/ Ameliorer une arme';
  rep4:='4/ Ameliorer une armure';
  rep5:='5/ Sortir de l''atelier';
  rep6:='';
  squelettePage;
  case choix of
       '1': pageEpee;
       '2': pageArmure;
       '3': pageAmeEpee;

       '5':pageForthiver;




       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageForge;

  end;
end;

procedure pageEpee;
begin


  position:='Forge de Forthiver';
  texte1:='Epee';
  texte2:='';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Fabriquer une arme en acier';
  rep2:='2/ Fabriquer une arme en argent';
  rep3:='3/ Fabriquer une arme en ver dragon';
  rep4:='4/ Retour';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': pageCraftE1;
       '2': begin
            if lvlForge<1 then
            begin
            deplacerCurseurXY(12,16);
            writeln('Vous n avez pas le niveau necessaire, il faut etre niveau 2');
            attendre(1000);
            pageEpee;
            end
            else
            pageCraftE2;

            end;

       '3':begin
            if lvlForge<3 then
            begin
            deplacerCurseurXY(12,16);
            writeln('Vous n avez pas le niveau necessaire, il faut etre niveau 4');
            attendre(1000);
            pageEpee;
            end
            else
            pageCraftE3;

            end;
       '4':pageForge;




       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageEpee;

  end;
end;

procedure pageAmeEpee;
begin


  position:='Forge de Forthiver';
  texte1:='Epee';
  texte2:='';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Ameliorer une arme en acier';
  rep2:='2/ Ameliorer une arme en argent';
  rep3:='3/ Retour';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            if lvlForge<2 then
            begin
            deplacerCurseurXY(12,16);
            writeln('Vous n avez pas le niveau necessaire, il faut etre niveau 3');
            attendre(1000);
            pageEpee;
            end
            else
            pageCraftEA1;

            end;

       '2':begin
            if lvlForge<4 then
            begin
            deplacerCurseurXY(12,16);
            writeln('Vous n avez pas le niveau necessaire, il faut etre niveau 5');
            attendre(1000);
            pageEpee;
            end
            else
            //pageCraftEA2;

            end;
       '3':pageForge;




       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageEpee;

  end;
end;

procedure pageArmure;
begin


  position:='Forge de Forthiver';
  texte1:='Armure';
  texte2:='';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Fabriquer une armure en acier';
  rep2:='2/ Fabriquer une armure en argent';
  rep3:='3/ Fabriquer une armure en ver dragon';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': pageCraftA3;
       '2': begin
            if lvlForge<1 then
            begin
            deplacerCurseurXY(12,16);
            writeln('Vous n avez pas le niveau necessaire, il faut etre niveau 2');
            attendre(1000);
            pageArmure;
            end
            else
            pageCraftA2;

            end;

       '3':begin
            if lvlForge<3 then
            begin
            deplacerCurseurXY(12,16);
            writeln('Vous n avez pas le niveau necessaire, il faut etre niveau 4');
            attendre(1000);
            pageEpee;
            end
            else
            pageCraftA3;

            end;




       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageArmure;

  end;
end;


procedure pageCraftE1;
var i,j,t:integer;
    choix1:integer;
    objetV1,objetV2:string;
begin

  position:='Forge de Forthiver';
  squelette;
  menuPersonnage;
  deplacerCurseurXY(12,12);
  writeln('Choisir deux ingredient pour faire une arme');

  dessinerCadreXY(60,10,100,31,simple,15,0);
  deplacerCurseurXY(80,11);
  writeln('Ressources');
  dessinerCadreXY(60,12,100,31,simple,15,0);
  dessinerCadreXY(56,12,60,31,simple,15,0);

  for  i := 1 to 10 do
      begin
           deplacerCurseurXY(58,12+i);
           writeln(i);
      end;



        for i := 0 to 10 do
        begin
                  for j := 2 to 29 do
                  begin
                  deplacerCurseurXY(62+j,13+i);
                  writeln(tabRessources[j,i]);
                  end;
        end;

  deplacerCurseurXY(12,33);//pos du curseur
  writeln('Choisir 2 ingredients : ');

  objetV1:=videSac;
  enleveEspace(objetV1);


  deplacerCurseurXY(35,33);
  writeln('        ');


  objetV2:=videSac;
  enleveEspace(objetV2);

  epeeAcier(objetV1,objetV2);



end;

procedure pageCraftE2;
var i,j,t:integer;
    choix1:integer;
    objetV1,objetV2:string;
begin

  position:='Forge de Forthiver';
  squelette;
  menuPersonnage;
  deplacerCurseurXY(12,12);
  writeln('Choisir deux ingredient pour faire une arme');

  dessinerCadreXY(60,10,100,31,simple,15,0);
  deplacerCurseurXY(80,11);
  writeln('Ressources');
  dessinerCadreXY(60,12,100,31,simple,15,0);
  dessinerCadreXY(56,12,60,31,simple,15,0);

  for  i := 1 to 10 do
      begin
           deplacerCurseurXY(58,12+i);
           writeln(i);
      end;



        for i := 0 to 10 do
        begin
                  for j := 2 to 29 do
                  begin
                  deplacerCurseurXY(62+j,13+i);
                  writeln(tabRessources[j,i]);
                  end;
        end;

  deplacerCurseurXY(12,33);//pos du curseur
  writeln('Choisir 2 ingredients : ');

  objetV1:=videSac;
  enleveEspace(objetV1);


  deplacerCurseurXY(35,33);
  writeln('        ');


  objetV2:=videSac;
  enleveEspace(objetV2);

  epeeArgent(objetV1,objetV2);



end;

procedure pageCraftE3;

var i,j,t:integer;
    choix1:integer;
    objetV1,objetV2:string;
begin

  position:='Forge de Forthiver';
  squelette;
  menuPersonnage;
  deplacerCurseurXY(12,12);
  writeln('Choisir deux ingredient pour faire une arme');

  dessinerCadreXY(60,10,100,31,simple,15,0);
  deplacerCurseurXY(80,11);
  writeln('Ressources');
  dessinerCadreXY(60,12,100,31,simple,15,0);
  dessinerCadreXY(56,12,60,31,simple,15,0);

  for  i := 1 to 10 do
      begin
           deplacerCurseurXY(58,12+i);
           writeln(i);
      end;



        for i := 0 to 10 do
        begin
                  for j := 2 to 29 do
                  begin
                  deplacerCurseurXY(62+j,13+i);
                  writeln(tabRessources[j,i]);
                  end;
        end;

  deplacerCurseurXY(12,33);//pos du curseur
  writeln('Choisir 2 ingredients : ');

  objetV1:=videSac;
  enleveEspace(objetV1);


  deplacerCurseurXY(35,33);
  writeln('        ');


  objetV2:=videSac;
  enleveEspace(objetV2);

  epeeDragon(objetV1,objetV2);



end;

procedure pageCraftEA1;
var i,j,t:integer;
    choix1:integer;
    objetV1,objetV2:string;
begin

  position:='Forge de Forthiver';
  squelette;
  menuPersonnage;
  deplacerCurseurXY(12,12);
  writeln('Choisir deux ingredient pour faire une arme');

  deplacerCurseurXY(12,33);//pos du curseur
  writeln('Choisir une epee et un metal : ');


  dessinerCadreXY(60,10,100,31,simple,15,0);
  deplacerCurseurXY(80,11);
  writeln('Epees');
  dessinerCadreXY(60,12,100,31,simple,15,0);
  dessinerCadreXY(56,12,60,31,simple,15,0);



  for  i := 1 to 10 do
      begin
           deplacerCurseurXY(58,12+i);
           writeln(i);
      end;



        for i := 0 to 10 do
        begin
                  for j := 2 to 29 do
                  begin
                  deplacerCurseurXY(62+j,13+i);
                  writeln(tabEpee[j,i]);
                  end;
        end;





  objetV1:=videEpee;
  enleveEspace(objetV1);

  squelette;
  menuPersonnage;
  deplacerCurseurXY(12,12);
  writeln('Choisir deux ingredient pour faire une arme');

  deplacerCurseurXY(12,33);//pos du curseur
  writeln('Choisir une epee et un metal : ');


  dessinerCadreXY(60,10,100,31,simple,15,0);
  deplacerCurseurXY(80,11);
  writeln('Ressources');
  dessinerCadreXY(60,12,100,31,simple,15,0);
  dessinerCadreXY(56,12,60,31,simple,15,0);



  for  i := 1 to 10 do
      begin
           deplacerCurseurXY(58,12+i);
           writeln(i);
      end;



        for i := 0 to 10 do
        begin
                  for j := 2 to 29 do
                  begin
                  deplacerCurseurXY(62+j,13+i);
                  writeln(tabRessources[j,i]);
                  end;
        end;


  objetV2:=videSac;
  enleveEspace(objetV2);

  epeeAcier(objetV1,objetV2);



end;

function videEpee():string;
  var i,j,k,m,choisir,vendu:integer;
    valeurVente:integer;
    test:char;
    test2,test3:string;
    maxTab:integer;
begin

    for i := 0 to 9 do  if (tabEpee[0,i]='1') then maxTab:=i+1;  //donne la colonne max du tableau

    deplacerCurseurXY(35,33);
    readln(choisir);


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
    result:=test3;



end;


procedure epeeAcier(objetV1,objetV2:string);
var
   i:integer;
   nomA:string;
begin
  if ((objetV1='OsdeDraugr') or (objetV2='OsdeDraugr')) and ((objetV1='Acier') or (objetV2='Acier')) then
     begin
       nomA:='Epee en acier';
       tabEpee[0,caseInventaire]:='1';
       tabEpee[0,caseInventaire]:='1';
       for i := 1 to length(nomA) do tabEpee[i+1,caseInventaire] := nomA[i];
       caseInventaire := caseInventaire+1;
     end;
end;

procedure epeeAcierAme(objetV1,objetV2:string);
var
   i:integer;
   nomA:string;
begin
  if ((objetV1='Epeeenacier') or (objetV2='Epeeenacier')) and ((objetV1='Argent') or (objetV2='Argent')) then
     begin
       nomA:='Epee en argent|';
       tabEpee[0,caseInventaire]:='1';
       tabEpee[0,caseInventaire]:='1';
       for i := 1 to length(nomA) do tabEpee[i+1,caseInventaire] := nomA[i];
       caseInventaire := caseInventaire+1;
     end;
end;

procedure epeeArgentAme(objetV1,objetV2:string);
var
   i:integer;
   nomA:string;
begin
  if ((objetV1='Epeeenargent') or (objetV2='Epeeenargent')) and ((objetV1='Essencedudragon') or (objetV2='Essencedudragon')) then
     begin
       nomA:='Epee en ver dragon';
       tabEpee[0,caseInventaire]:='1';
       tabEpee[0,caseInventaire]:='1';
       for i := 1 to length(nomA) do tabEpee[i+1,caseInventaire] := nomA[i];
       caseInventaire := caseInventaire+1;
     end;
end;

procedure epeeArgent(objetV1,objetV2:string);
var
   i:integer;
   nomA:string;
begin
  if ((objetV1='OsdeDraugr') or (objetV2='OsdeDraugr')) and ((objetV1='Argent') or (objetV2='Argent')) then
     begin
       nomA:='Epee en argent';
       tabEpee[0,caseInventaire]:='1';
       tabEpee[0,caseInventaire]:='2';
       for i := 1 to length(nomA) do tabEpee[i+1,caseInventaire] := nomA[i];
       caseInventaire := caseInventaire+1;
     end;
end;

procedure epeeDragon(objetV1,objetV2:string);

var
   i:integer;
   nomA:string;
begin
  if ((objetV1='Boisancestral') or (objetV2='Boisancestral')) and ((objetV1='Essencedudragon') or (objetV2='Essencedudragon')) then
     begin
       nomA:='Epee en ver dragon';
       tabEpee[0,caseInventaire]:='1';
       tabEpee[0,caseInventaire]:='4';
       for i := 1 to length(nomA) do tabEpee[i+1,caseInventaire] := nomA[i];
       caseInventaire := caseInventaire+1;
     end;
end;

procedure pageCraftA1;
var i,j,t:integer;
    choix1:integer;
    objetV1,objetV2:string;
begin

  position:='Forge de Forthiver';
  squelette;
  menuPersonnage;
  deplacerCurseurXY(12,12);
  writeln('Choisir deux ingredient pour faire une armure');

  dessinerCadreXY(60,10,100,31,simple,15,0);
  deplacerCurseurXY(80,11);
  writeln('Ressources');
  dessinerCadreXY(60,12,100,31,simple,15,0);
  dessinerCadreXY(56,12,60,31,simple,15,0);

  for  i := 1 to 10 do
      begin
           deplacerCurseurXY(58,12+i);
           writeln(i);
      end;



        for i := 0 to 10 do
        begin
                  for j := 2 to 29 do
                  begin
                  deplacerCurseurXY(62+j,13+i);
                  writeln(tabRessources[j,i]);
                  end;
        end;

  deplacerCurseurXY(12,33);//pos du curseur
  writeln('Choisir 2 ingredients : ');

  objetV1:=videSac;
  enleveEspace(objetV1);


  deplacerCurseurXY(35,33);
  writeln('        ');


  objetV2:=videSac;
  enleveEspace(objetV2);

  armureAcier(objetV1,objetV2);



end;

procedure pageCraftA2;
var i,j,t:integer;
    choix1:integer;
    objetV1,objetV2:string;
begin

  position:='Forge de Forthiver';
  squelette;
  menuPersonnage;
  deplacerCurseurXY(12,12);
  writeln('Choisir deux ingredient pour faire une armure');

  dessinerCadreXY(60,10,100,31,simple,15,0);
  deplacerCurseurXY(80,11);
  writeln('Ressources');
  dessinerCadreXY(60,12,100,31,simple,15,0);
  dessinerCadreXY(56,12,60,31,simple,15,0);

  for  i := 1 to 10 do
      begin
           deplacerCurseurXY(58,12+i);
           writeln(i);
      end;



        for i := 0 to 10 do
        begin
                  for j := 2 to 29 do
                  begin
                  deplacerCurseurXY(62+j,13+i);
                  writeln(tabRessources[j,i]);
                  end;
        end;

  deplacerCurseurXY(12,33);//pos du curseur
  writeln('Choisir 2 ingredients : ');

  objetV1:=videSac;
  enleveEspace(objetV1);


  deplacerCurseurXY(35,33);
  writeln('        ');


  objetV2:=videSac;
  enleveEspace(objetV2);

  armureArgent(objetV1,objetV2);



end;

procedure pageCraftA3;

var i,j,t:integer;
    choix1:integer;
    objetV1,objetV2:string;
begin

  position:='Forge de Forthiver';
  squelette;
  menuPersonnage;
  deplacerCurseurXY(12,12);
  writeln('Choisir deux ingredient pour faire une armure');

  dessinerCadreXY(60,10,100,31,simple,15,0);
  deplacerCurseurXY(80,11);
  writeln('Ressources');
  dessinerCadreXY(60,12,100,31,simple,15,0);
  dessinerCadreXY(56,12,60,31,simple,15,0);

  for  i := 1 to 10 do
      begin
           deplacerCurseurXY(58,12+i);
           writeln(i);
      end;



        for i := 0 to 10 do
        begin
                  for j := 2 to 29 do
                  begin
                  deplacerCurseurXY(62+j,13+i);
                  writeln(tabRessources[j,i]);
                  end;
        end;

  deplacerCurseurXY(12,33);//pos du curseur
  writeln('Choisir 2 ingredients : ');

  objetV1:=videSac;
  enleveEspace(objetV1);


  deplacerCurseurXY(35,33);
  writeln('        ');


  objetV2:=videSac;
  enleveEspace(objetV2);

  armureDragon(objetV1,objetV2);



end;

procedure armureAcier(objetV1,objetV2:string);
var
   i:integer;
   nomA:string;
begin
  if ((objetV1='OsdeDraugr') or (objetV2='OsdeDraugr')) and ((objetV1='Acier') or (objetV2='Acier')) then
     begin
       nomA:='Epee en acier|';
       tabArmure[0,caseInventaire2]:='1';
       tabArmure[0,caseInventaire2]:='1';
       for i := 1 to length(nomA) do tabEpee[i+1,caseInventaire2] := nomA[i];
       caseInventaire2 := caseInventaire2+1;
     end;
end;

procedure armureArgent(objetV1,objetV2:string);
var
   i:integer;
   nomA:string;
begin
  if ((objetV1='OsdeDraugr') or (objetV2='OsdeDraugr')) and ((objetV1='Argent') or (objetV2='Argent')) then
     begin
       nomA:='Epee en argent|';
       tabArmure[0,caseInventaire2]:='1';
       tabArmure[0,caseInventaire2]:='2';
       for i := 1 to length(nomA) do tabEpee[i+1,caseInventaire2] := nomA[i];
       caseInventaire2 := caseInventaire2+1;
     end;
end;

procedure armureDragon(objetV1,objetV2:string);

var
   i:integer;
   nomA:string;
begin
  if ((objetV1='Boisancestral') or (objetV2='Boisancestral')) and ((objetV1='Essencedudragon') or (objetV2='Essencedudragon')) then
     begin
       nomA:='Epee en ver dragon';
       tabArmure[0,caseInventaire2]:='1';
       tabArmure[0,caseInventaire2]:='4';
       for i := 1 to length(nomA) do tabArmure[i+1,caseInventaire2] := nomA[i];
       caseInventaire2 := caseInventaire2+1;
     end;
end;

end.

