unit unitAlchimiste;


{$codepage utf8}

interface

uses
  Classes, SysUtils,unitSquelette;

var          //horizontale//verticale(je crois)
    tabPotions : array[0..30,0..10] of char;
    tabRessources : array[0..30,0..10] of char;
    testesttestest:integer;
    capaciteSac:integer;



procedure Sac(var monstre:monster);
procedure SacARessources(posPot:integer;var monstre:monster);
procedure pageAlchimiste;
procedure pageCraft1;
procedure pageCraft2;
function videSac():string;


procedure enleveEspace(var mot:string);
procedure unPot(objetV1:string);
procedure deuxPot(objetV1,objetV2:string);
procedure utilisePotion(choix:string);
function videSacP():string;
procedure utilisePotionCombat(choix:string;var monstre:monster);

implementation
uses GestionEcran,unitPage,unitInventaire,unitCombat,unitRace;
var
         choisir:integer;
         casePot:integer;
         choisirP:integer;
         tempsM,tempsH:integer;






procedure Sac(var monstre:monster);
var i,j,k,m,posPot:integer;

begin
  squelette;
  menuPersonnage;
  posPot:=1;
    dessinerCadreXY(40,10,80,31,simple,15,0);
    deplacerCurseurXY(58,11);
    writeln('Potions');
    dessinerCadreXY(40,12,80,31,simple,15,0);

    dessinerCadreXY(90,10,130,31,simple,15,0);
    deplacerCurseurXY(108,11);
    writeln('Ressources');
    dessinerCadreXY(90,12,130,31,simple,15,0);




    m:=0;
    for i := 0 to 10 do
    begin
              for j := 2 to 29 do
              begin
              deplacerCurseurXY(42+j,13+i);
              writeln(tabPotions[j,i]);

              end;

    end;

    for i := 0 to 10 do
    begin
              for j := 2 to 29 do
              begin
              deplacerCurseurXY(92+j,13+i);
              writeln(tabRessources[j,i]);
              end;

    end;




  deplacerCurseurXY(3,37);
  writeln('1/ Choisir une potion');

  deplacerCurseurXY(3,39);
  writeln('2/ Sortir du sac');

  deplacerCurseurXY(12,33);//pos du curseur
  writeln('Choisir un numero pour realiser une action : ');
  deplacerCurseurXY(57,33);

  readln(conditionQuitter);


  case conditionQuitter of
         '1':begin
         tempsH:=0;
         tempsM:=5;
         temps(tempsM,tempsH);
         SacARessources(posPot,monstre);

         end;




    end;
  while conditionQuitter<>'2' do
  begin
       utiliseMenuPersonnage(choix);
       Inventaire;

  end






end;

procedure SacARessources(posPot:integer;var monstre:monster);
var i,j,k:integer;

    test:char;
    test2:string;

    objetP:string;

begin
      squelette;
      menuPersonnage;

      dessinerCadreXY(60,10,100,31,simple,15,0);
      deplacerCurseurXY(80,11);
      writeln('Potions');
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
                  writeln(tabPotions[j,i]);
                  end;
        end;

        deplacerCurseurXY(5,38);
        writeln('Qu''elle potion voulez vous utilisez ?');
        test2:='                                        ';


        objetP:=videSacP;
        enleveEspace(objetP);
        readln;
        case posPot of
               1:utilisePotion(objetP);
               2:utilisePotionCombat(objetP,monstre);

        end;

        j:=0;





    end;

procedure pageAlchimiste;
begin


  position:='Atelier de Aubetoile';
  texte1:='Bienvenue dans le plus grand atelier d alchimiste du royaume';
  texte2:='';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Fabriquer une potion avec 1 ingredient';
  rep2:='2/ Fabriquer une potion avec 2 ingredients';
  rep3:='3/ Sortir de l''atelier';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': pageCraft1;
       '2': begin
            if lvlAlchi<2 then
            begin
            deplacerCurseurXY(12,16);
            writeln('Vous n avez pas le niveau necessaire, il faut etre niveau 3');
            attendre(1000);
            pageAlchimiste;
            end
            else
            pageCraft2;

            end;
       '3' :
         begin
             pageAubetoile;
            end;




       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageAlchimiste;

  end;
end;

procedure pageCraft1;
var i,j,t:integer;
    choix1:integer;
    objetV:string;
begin

  position:='Atelier de Aubetoile';
  squelette;
  menuPersonnage;
  deplacerCurseurXY(12,12);
  writeln('Choisir un ingredient pour faire une potion');

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
  writeln('Choisir l ingredient : ');

  objetV:=videSac;
  enleveEspace(objetV);

  unPot(objetV);
  xpAlchi:=xpAlchi+1;
  pageAlchimiste;


end;

procedure pageCraft2;
var i,j,t:integer;
    choix1:integer;
    objetV1,objetV2:string;
begin

  position:='Atelier de Aubetoile';
  squelette;
  menuPersonnage;
  deplacerCurseurXY(12,12);
  writeln('Choisir un ingredient pour faire une potion');

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


  deuxPot(objetV1,objetV2);
  xpAlchi:=xpAlchi+2;
  pageAlchimiste;


end;


function videSac():string;
var q,j,k,m,i,choisir,vider:integer;

    test:char;
    test2,objetV:string;
    maxTabSac:integer;

begin
  test2:='                                         ';

  for q := 0 to 9 do  if (tabRessources[2,q]<>' ') then maxTabSac:=q+1;  //donne la colonne max du tableau

    deplacerCurseurXY(35,33);
    readln(choisir);

    vider:=choisir;
    j:=1;

    objetV:='                                         ';

    for i:=1 to length(objetV) do objetV[i]:=' ';
    for k := 2 to 29 do
    begin
         test:=tabRessources[k,vider-1];     //rentre valeur ligne dans test3
         objetV[j]:=test;             //pour afficher ce que ta vendu
         j:=j+1;                     //
    end;

    vider:=vider-1; //met vendu à la valeur du tableau cat tableau commence a 0
    for q := 1 to length(test2) do       //
    begin                                //
         tabRessources[q,vider] := ' ';    //supprime l'épée a la ligne choisie
    end;


    for m := 0 to ((maxTabSac-choisir)) do //peut-etre le probleme la condition ????
    begin

    j:=1;
    for k := 1 to 29 do
    begin
         if (maxTabSac=vider+1) then
         begin
         test:=tabRessources[k,vider];     //rentre valeur ligne+1 dans test2
         test2[j]:=test;             //
         j:=j+1;
         end
         else
         begin
         test:=tabRessources[k,vider+1];     //rentre valeur ligne+1 dans test2
         test2[j]:=test;             //
         j:=j+1;                     //
         end;
    end;

    if (maxTabSac=vider+1) then
         for q := 1 to 29 do tabRessources[q,vider] := ' '    //supprime l'épée n+1
    else
        for q := 1 to 29 do tabRessources[q,vider+1] := ' ';

    for q := 1 to 29 do       //
    begin                                //
         tabRessources[q,vider+1] := ' ';    //supprime l'épée n+1
    end;

    for q := 1 to 29 do tabRessources[q,vider] := test2[q];

    vider:=vider+1;
    end;             /////////////////////////////////

    tabRessources[0,maxTabSac-1]:='0';
    tabRessources[1,maxTabSac-1]:='0';
    caseR:=caseR-1;

    for q := 0 to 9 do
    begin
              for j := 2 to 29 do
              begin
              deplacerCurseurXY(62+j,13+q);    //Affiche les épées du tableau
              writeln(tabRessources[j,q]);
              end;
    end;

    deplacerCurseurXY(5,15);
    writeln('Objet utiliser : ');
    deplacerCurseurXY(5,16);
    writeln(objetV);
    readln;

    result:=objetV;

end;

function videSacP():string;
var q,j,k,m,i,choisirP,vider:integer;

    test:char;
    test2,objetV:string;
    maxTabSac:integer;

begin
  test2:='                                         ';

  for q := 0 to 9 do  if (tabPotions[2,q]<>' ') then maxTabSac:=q+1;  //donne la colonne max du tableau

    deplacerCurseurXY(43,38);
    readln(choisirP);

    vider:=choisirP;
    j:=1;

    objetV:='                                         ';

    for i:=1 to length(objetV) do objetV[i]:=' ';
    for k := 2 to 29 do
    begin
         test:=tabPotions[k,vider-1];     //rentre valeur ligne dans test3
         objetV[j]:=test;             //pour afficher ce que ta vendu
         j:=j+1;                     //
    end;

    vider:=vider-1; //met vendu à la valeur du tableau cat tableau commence a 0
    for q := 1 to length(test2) do        //
    begin                                //
         tabPotions[q,vider] := ' ';    //supprime l'épée a la ligne choisie
    end;


    for m := 0 to ((maxTabSac-choisirP)) do //peut-etre le probleme la condition ????
    begin

    j:=1;
    for k := 1 to 29 do
    begin
         if (maxTabSac=vider+1) then
         begin
         test:=tabPotions[k,vider];     //rentre valeur ligne+1 dans test2
         test2[j]:=test;             //
         j:=j+1;
         end
         else
         begin
         test:=tabPotions[k,vider+1];     //rentre valeur ligne+1 dans test2
         test2[j]:=test;             //
         j:=j+1;                     //
         end;
    end;

    if (maxTabSac=vider+1) then
         for q := 1 to 29 do tabPotions[q,vider] := ' '    //supprime l'épée n+1
    else
        for q := 1 to 29 do tabPotions[q,vider+1] := ' ';

    for q := 1 to 29 do       //
    begin                                //
         tabPotions[q,vider+1] := ' ';    //supprime l'épée n+1
    end;

    for q := 1 to 29 do tabPotions[q,vider] := test2[q];

    vider:=vider+1;
    end;             /////////////////////////////////

    tabPotions[0,maxTabSac-1]:='0';
    tabPotions[1,maxTabSac-1]:='0';
    casePot:=casePot-1;

    for q := 0 to 9 do
    begin
              for j := 2 to 29 do
              begin
              deplacerCurseurXY(62+j,13+q);    //Affiche les épées du tableau
              writeln(tabPotions[j,q]);
              end;
    end;

    deplacerCurseurXY(5,15);
    writeln('Objet utiliser : ');
    deplacerCurseurXY(5,16);
    writeln(objetV);
    readln;

    result:=objetV;

end;

procedure enleveEspace(var mot:string);
var
  resultat:string;
  i:integer;
  testest:boolean;

begin
resultat:='';
testest:=FALSE;
i:=1;
while (testest<>TRUE) do

    begin
    if mot[i] = '|' then testest:= TRUE
    else if mot[i]<>' ' then resultat:=resultat+mot[i];
    i:=i+1;
    end;

mot:=resultat;



end;

procedure unPot(objetV1:string);
var
  ww,j:integer;
  nomP:string;

begin


if testesttestest=0 then
begin
testesttestest:=1;
casePot:=0;
end;
case objetV1 of
     'OsdeDraugr':begin
                       nomP:='Potion basic|';
                       end;
     'Venin':begin
                       nomP:='Potion poison|';
                       end;
     'Espritdudemon':begin
                       nomP:='Potion spirituel|';
                       end;

end;

for ww := 1 to length(nomP) do tabPotions[ww+1,casePot] := nomP[ww];
casePot := casePot+1;

end;

procedure deuxPot(objetV1,objetV2:string);
var
  ww,j:integer;
  nomP:string;

begin


if testesttestest=0 then
begin
testesttestest:=1;
casePot:=0;
end;
if ((objetV1='OsdeDraugr') or (objetV2='OsdeDraugr')) and ((objetV1='Planteafrodisiaque') or (objetV2='Planteafrodisiaque')) then nomP:='Potion de soin|'
else if ((objetV1='Venin') or (objetV2='Venin')) and ((objetV1='Ortie') or (objetV2='Ortie')) then nomP:='Potion mortel|';

for ww := 1 to length(nomP) do tabPotions[ww+1,casePot] := nomP[ww];
casePot := casePot+1;

end;


procedure utilisePotion(choix:string);
begin
tempsH:=01;
tempsM:=0;
temps(tempsM,tempsH);
case choix of
     'Potionbasic': begin
     if personnage.PDV<personnage.PDVMAX-15 then personnage.PDV:=personnage.PDV+15
                       else personnage.PDV:=personnage.PDVMAX;

     end;

     'Potionpoison': begin
     if personnage.PDV>15 then personnage.PDV:=personnage.PDV-15
                       else halt;

     end;

     'Potionspirituel': begin
                        pageForthiver;

     end;

     'Potiondesoin': begin
     if personnage.PDV<personnage.PDVMAX-30 then personnage.PDV:=personnage.PDV+30
                       else personnage.PDV:=personnage.PDVMAX;

     end;

     'Potionmortel': begin
     if personnage.PDV>30 then personnage.PDV:=personnage.PDV-30
                       else halt;

     end;




end;

end;

procedure utilisePotionCombat( choix:string;var monstre:monster);
begin

case choix of
     'Potionbasic': begin
     if personnage.PDV<personnage.PDVMAX-15 then personnage.PDV:=personnage.PDV+15
                       else personnage.PDV:=personnage.PDVMAX;

     end;

     'Potionpoison': begin
     if monstre.PDV>0+15 then monstre.PDV:=monstre.PDV-15
                       else monstre.pdv:=0;

     end;

     'Potiondesoin': begin
     if personnage.PDV<personnage.PDVMAX-30 then personnage.PDV:=personnage.PDV+30
                       else personnage.PDV:=personnage.PDVMAX;

     end;

     'Potionmortel': begin
     if monstre.PDV>30 then monstre.PDV:=monstre.PDV-30
                       else monstre.pdv:=0;

     end;





end;

end;

end.

