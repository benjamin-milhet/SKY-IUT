unit unitCombat;


{$codepage utf8}

interface

uses
  Classes, SysUtils;

type

  attaqueP = record
          nom:string;
          degat:real;
          end;


var


  attaquePerso1:attaqueP;
  attaquePerso2:attaqueP;
  //attaquePerso3:attaqueP;
  //attaquePerso4:attaqueP;
  choixCombat:integer;
  caseR:integer;




procedure creationBoss;//creation du dragon
procedure creationMonstreB1;//creation du monstre de base
procedure creationMonstreB2;
procedure creationMonstreB3;
procedure creationMonstreN1;
procedure creationMonstreN2;
procedure creationMonstreM1;
procedure creationGardien1;
procedure creationGardien2;
procedure creationMarin;
procedure choixMonstre; //choix du monstre suivant la zone
procedure attaquePersonnage; //enleve les points de vie au monstre suivant l'attaque
procedure attaqueMonstre; //enleve les points de vie au hero suivant l'attaque
procedure actionPerso;  //permet d'afficher l'attaque du hero
procedure actionMonstre;//permet d'afficher l'attaque du monstre
procedure tour; // toute les actions a realise dans un tour
procedure conditionTour;//appelle la procedure jusqu'a ce que quelqu'un meurt
procedure debutCombat;//procedure a appele pour lance un combat
procedure apresCombat1;//permet de continuer le jeu une fois le combat termine
//procedure debutCombatBoss;//permet d'appele le combat du dragon
procedure loot;//permet de recupere des ressources et des golds a la fin d'un combat
procedure animationAttaqueHero;
procedure animationAttaqueMonstre;


implementation


uses
  GestionEcran,unitPage, unitRace,unitSquelette,unitEquipement,unitInventaire,unitAlchimiste;

var
  monstre:monster;
  attaqueMonstre1:attaqueM;
  attaqueMonstre2:attaqueM;
  varAttaquePersonnage:string;
  varAttaqueMonstre:string;
  choixAttaqueP:integer;
  choixAttaqueM:integer;
  nomR : string;
  caseR2,testR : integer;



procedure creationBoss;


begin
  monstre.nomM:='Dragon Blanc aux yeux bleu';//nom du dragon
  monstre.PDV:=800;//point de vie du dragon
  //monstre.PM:=400;//mana du dragon
  attaqueMonstre1.nom:='soufle du dragon';//nom premiere attaque
  attaqueMonstre1.degat:=80;//degat premiere attaque
  attaqueMonstre2.nom:='vol';//nom deuxieme attaque
  attaqueMonstre2.degat:=60;//degat deuxieme attaque
  nomR:='Essence du dragon|';


end;

procedure creationMonstreB1;

begin
  monstre.nomM:='Draugr';//nom du monstre
  monstre.PDV:=30;//point de vie du monstre
  monstre.typeM:='monstreBasic';
  //monstre.PM:=80;
  attaqueMonstre1.nom:='Sabre';//nom premiere attaque
  attaqueMonstre1.degat:=10;//degat premiere attaque
  attaqueMonstre2.nom:='Coup de Bouclier';//nom deuxieme attaque
  attaqueMonstre2.degat:=15;//degat deuxieme attaque
  nomR:='Os de Draugr|';

end;

procedure creationMonstreB2;

begin
  monstre.nomM:='ragnard';//nom du monstre
  monstre.PDV:=50;//point de vie du monstre
  monstre.typeM:='monstreBasic';
  //monstre.PM:=80;
  attaqueMonstre1.nom:='dague';//nom premiere attaque
  attaqueMonstre1.degat:=20;//degat premiere attaque
  attaqueMonstre2.nom:='peur';//nom deuxieme attaque
  attaqueMonstre2.degat:=25;//degat deuxieme attaque
  nomR:='Ortie|';
end;

procedure creationMonstreB3;

begin
  monstre.nomM:='vasard';//nom du monstre
  monstre.PDV:=60;//point de vie du monstre
  monstre.typeM:='monstreBasic';
  //monstre.PM:=80;
  attaqueMonstre1.nom:='epee des enfers';//nom premiere attaque
  attaqueMonstre1.degat:=25;//degat premiere attaque
  attaqueMonstre2.nom:='coup d os';//nom deuxieme attaque
  attaqueMonstre2.degat:=30;//degat deuxieme attaque
  nomR:='Bois ancestral|';
end;

procedure creationMonstreN2;

begin
  monstre.nomM:='ragnard nocturne';//nom du monstre
  monstre.PDV:=50;//point de vie du monstre
  monstre.typeM:='monstreNuit';
  //monstre.PM:=80;
  attaqueMonstre1.nom:='dague';//nom premiere attaque
  attaqueMonstre1.degat:=40;//degat premiere attaque
  attaqueMonstre2.nom:='peur';//nom deuxieme attaque
  attaqueMonstre2.degat:=50;//degat deuxieme attaque
  nomR:='Ortie|';
end;

procedure creationMonstreN3;

begin
  monstre.nomM:='vasard nocturne';//nom du monstre
  monstre.PDV:=120;//point de vie du monstre
  monstre.typeM:='monstreNuit';
  //monstre.PM:=80;
  attaqueMonstre1.nom:='epee des enfers';//nom premiere attaque
  attaqueMonstre1.degat:=50;//degat premiere attaque
  attaqueMonstre2.nom:='coup d os';//nom deuxieme attaque
  attaqueMonstre2.degat:=60;//degat deuxieme attaque
  nomR:='Bois ancestral|';
end;

procedure creationMonstreN1;

begin
  monstre.nomM:='Draugr nocturne';//nom du monstre
  monstre.PDV:=60;//point de vie du monstre
  monstre.typeM:='monstreNuit';
  //monstre.PM:=80;
  attaqueMonstre1.nom:='Sabre';//nom premiere attaque
  attaqueMonstre1.degat:=20;//degat premiere attaque
  attaqueMonstre2.nom:='Coup de Bouclier';//nom deuxieme attaque
  attaqueMonstre2.degat:=30;//degat deuxieme attaque
  nomR:='Os de Draugr|';

end;

procedure creationMonstreM1;

begin
  monstre.nomM:='givrepeire';//nom du monstre
  monstre.PDV:=110;//point de vie du monstre
  monstre.typeM:='monstreMecha';
  //monstre.PM:=80;
  attaqueMonstre1.nom:='Piqure';//nom premiere attaque
  attaqueMonstre1.degat:=10;//degat premiere attaque  40
  attaqueMonstre2.nom:='explosion';//nom deuxieme attaque
  attaqueMonstre2.degat:=10;//degat deuxieme attaque  50
  nomR:='Venin|';
end;

procedure creationGardien1;

begin
  monstre.nomM:='Gardien d Aubetoile';//nom du monstre
  monstre.PDV:=300;//point de vie du monstre
  monstre.typeM:='gardien';
  //monstre.PM:=80;
  attaqueMonstre1.nom:='dague de verre ';//nom premiere attaque
  attaqueMonstre1.degat:=70;//degat premiere attaque
  attaqueMonstre2.nom:='coup de point';//nom deuxieme attaque
  attaqueMonstre2.degat:=30;//degat deuxieme attaque
end;

procedure creationGardien2;

begin
  monstre.nomM:='Esprit de Forhiver';//nom du monstre
  monstre.PDV:=200;//point de vie du monstre
  monstre.typeM:='gardien';
  //monstre.PM:=80;
  attaqueMonstre1.nom:='Hallucination';//nom premiere attaque
  attaqueMonstre1.degat:=40;//degat premiere attaque
  attaqueMonstre2.nom:='Control mental';//nom deuxieme attaque
  attaqueMonstre2.degat:=30;//degat deuxieme attaque
  nomR:='Esprit du demon|';
end;

procedure creationMarin;

begin
  monstre.nomM:='Marin de Vendeaume';//nom du monstre
  monstre.PDV:=150;//point de vie du monstre
  monstre.typeM:='gardien';
  //monstre.PM:=80;
  attaqueMonstre1.nom:='Harpon';//nom premiere attaque
  attaqueMonstre1.degat:=25;//degat premiere attaque
  attaqueMonstre2.nom:='Corde';//nom deuxieme attaque
  attaqueMonstre2.degat:=30;//degat deuxieme attaque
  nomR:='Plante afrodisiaque|';
end;

procedure attaquePersonnage;
var
  posPot:integer;
begin
  deplacerCurseurXY(137,40);
  readln(choixAttaqueP);

  case choixAttaqueP of
       1:begin
            monstre.PDV:=monstre.PDV-attaquePerso1.degat;//enleve les points de vie au monstre suivant l'attaque
            varAttaquePersonnage:=attaquePerso1.nom;//stock le nom de l'attaque
            animationAttaqueHero;

       end;
       2:begin
            monstre.PDV:=monstre.PDV-attaquePerso2.degat;
            varAttaquePersonnage:=attaquePerso2.nom;
            animationAttaqueHero;
       end;

       3:begin
            posPot:=2;
            SacARessources(posPot,monstre);
            varAttaquePersonnage:='potion';
       end;

  end;

end;

procedure attaqueMonstre;
begin

  randomize;
  choixAttaqueM:=random(2);

  case choixAttaqueM of
       0:begin
            personnage.PDV:=personnage.PDV-(attaqueMonstre1.degat*armure.coefArmure);
            varAttaqueMonstre:=attaqueMonstre1.nom;
            animationAttaqueMonstre;

       end;
       1:begin
            personnage.PDV:=personnage.PDV-attaqueMonstre2.degat;
            varAttaqueMonstre:=attaqueMonstre2.nom;
            animationAttaqueMonstre;
       end;
  end;
end;
procedure actionPerso;
begin

  deplacerCurseurXY(12,33);
  writeln(personnage.nomPerso,' attaque ', varAttaquePersonnage);//affiche le nom de l'attqaque du hero
  //attendre(900);
  deplacerCurseurXY(12,33);
  writeln('                                                         ');//efface l'action precedente

end;

procedure actionMonstre;
begin

  deplacerCurseurXY(12,33);
  writeln(monstre.nomM,' attaque ', varAttaqueMonstre); //affiche le nom de l'attqaque du monstre
  //attendre(900);

end;

procedure tour;
begin

    attaquePersonnage;//procedure attaque du heros
    //actionPerso;
    if monstre.PDV<=0 then apresCombat1;
    attaqueMonstre; //procedure attaque du heros
    //actionMonstre;
    squeletteCombat(monstre);//rappeller la procedure pour la suie du combat
    case choixCombat of
         1:ASCIIdraugr;
         2:ASCIIgardienAubetoile;
         3:ASCIIgivrepeire;
         4:ASCIIesprit;
         5:ASCIIragnard;
    end;

end;

procedure conditionTour;
begin
    while (monstre.PDV>0) AND (personnage.PDV>0) do
    begin
       tour;


    end;
    //realiser un case of suivant les combat pour savoir quelle suite
    apresCombat1;
end;

procedure debutCombat;
begin
  choixMonstre;
  squeletteCombat(monstre);
  case choixCombat of
         1:ASCIIdraugr;
         2:ASCIIgardienAubetoile;
         3:ASCIIgivrepeire;
         4:ASCIIesprit;
         5:ASCIIragnard;
    end;
  conditionTour;
end;

procedure apresCombat1;
begin
  if personnage.PDV>monstre.PDV then
     begin
     case choixCombat of
     1:begin
       loot;
       pageForet;
       end;
     3:begin
       loot;
       pagePorteAubetoile;
       end;
     4:begin
       loot;
       pageForthiver;
       end;
     5:begin
       loot;
       pageBlancherive;
       end;
     6:begin
       loot;
       pageMorthal;
       end;
     7:begin //monstre unique pour l'histoire
       loot;
       squelette;
       deplacerCurseurXY(12,13);
       writeln('Vous avez vaincu le marin, vous decidez de voler son bateau et de se rendre a Falaise');
       attendre(3000);
       pageFalaise;
       end;



       end;
     end
     else mort;

     end;


procedure loot;
var
v,w:integer;
begin
  personnage.gold:=personnage.gold+5;
  for v := 1 to length(nomR) do tabRessources[v+1,caseR] := nomR[v];

  caseR := caseR+1;

end;

procedure choixMonstre;
begin
  case choixCombat of
       1:begin
       if (heure > 6) and (heure < 22) then creationMonstreB1
               else
                 begin
                 creationMonstreN1;
                 end;
       end;
       2:creationGardien1;
       3:creationMonstreM1;
       4:creationGardien2;
       5:creationBoss;
       6:begin
       if (heure > 6) and (heure < 22) then creationMonstreB2
               else
                 begin
                 creationMonstreN2;
                 end;
       end;
       7:creationMarin;

  end;
end;

procedure animationAttaqueHero;
var
test: text;
ligne:string;
nom:string;
i,j:integer;
begin
  effacerEtColorierEcran(15);
squeletteCombat(monstre);
actionPerso;
actionMonstre;
  case choixCombat of
         1:nom :='Image\draugr2.txt';
         2:nom :='Image\garde2.txt';
         3:nom :='Image\Givrepeire.txt';
         4:nom :='Image\esprit.txt';
         5:nom :='Image\Ragnard.txt';
    end;
  Assign (test, nom);
  Reset (test);
  i:=0;
  son(6,0);
  while not (eof (test)) AND (i<40) do
  begin
  readln(test,ligne);
   deplacerCurseurXY(60,4+i);
  writeln(ligne);
  i:=i+1;
  attendre(20);

end;

attendre(50);
effacerEtColorierEcran(15);
squeletteCombat(monstre);
actionPerso;
actionMonstre;
case choixCombat of
         1:ASCIIdraugr;
         2:ASCIIgardienAubetoile;
         3:ASCIIgivrepeire;
         4:ASCIIesprit;
         5:ASCIIragnard;
    end;

close(test);
end;


procedure animationAttaqueMonstre;
var i:integer;
begin
     son(8,0);
     for i:=0 to 2 do
     begin
     attendre(150);
     effacerEtColorierEcran(0);
     attendre(150);
     effacerEtColorierEcran(15);
     end;
     squeletteCombat(monstre);
     actionPerso;
     actionMonstre;

end;

end.



