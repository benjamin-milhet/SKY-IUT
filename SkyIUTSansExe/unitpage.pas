unit unitPage;
{$codepage utf8}
interface

uses
  Classes, SysUtils, GestionEcran, unitCombat, unitmagasin, unitInventaire, unitRace, unitSquelette,unitPersonnage,unitQuete,MMSystem,unitAlchimiste,unitForge,unitPrison;


var
  choix:string;

  choixMenu:string;

  position:string;

  Texte1:string;
  Texte2:string;
  Texte3:string;
  Texte4:string;
  Texte5:string;

  rep1:string;
  rep2:string;
  rep3:string;
  rep4:string;
  rep5:string;
  rep6:string;

  voirFemme:boolean;
  positionVille:integer;



procedure pageAccueil;
procedure Logo;
procedure SkyIUT;
procedure Priscilla;
procedure son(numeroMusique,stop:integer);
procedure ASCIIdraugr;
procedure ASCIIgivrepeire;
procedure ASCIIvasard;
procedure ASCIIragnard;
procedure ASCIIgardienAubetoile;
procedure ASCIIesprit;

procedure pageUN;
procedure pageBlancherive;
procedure pageVieux;
procedure gardeBlancherive;
procedure pageMorthal;
procedure pageJeuneFemme;
procedure pageMorthalSuite;
procedure pageEgout;
procedure pageTaverne;
procedure pageRepos;
procedure pageForet;
procedure pagePorteAubetoile;
procedure pageEquation;
procedure pageVoyageur;
procedure pageAubetoile;
procedure pageMarais;
procedure pageSousIle;
procedure pageForthiver;
procedure pageVendeaume;
procedure pagePortVendeaume;
procedure pageMarin;
procedure pageFalaise;
procedure pageMine;
procedure sauvegarder;
procedure chargement;
procedure pageCabaret;





implementation
var
  conditionVoyageur:boolean;
  tempsH:integer;
  tempsM:integer;




procedure son(numeroMusique,stop:integer);
var rand:integer;
begin
  rand:=random(2);
  if (stop=0) then
  begin
  case numeroMusique of
       1:sndPlaySound('Son\ChansonWitcher.wav', snd_Async or snd_NoDefault);

       2:sndPlaySound('Son\IntroSkyrim.wav', snd_Async or snd_NoDefault);

       3:sndPlaySound('Son\Taverne.wav', snd_Async or snd_NoDefault);

       4:sndPlaySound('Son\Vide.wav', snd_Async or snd_NoDefault);

       5:sndPlaySound('Son\18-25-2s-je-reinvite-labonne-a-manger-chez-moi-il-a-peur-dattraper-le-cholera-explication.wav', snd_Async or snd_NoDefault);

       6:sndPlaySound('Son\degat.wav', snd_Async or snd_NoDefault);

       7:sndPlaySound('Son\SonLoot.wav', snd_Async or snd_NoDefault);

       8:sndPlaySound('Son\DegatDuMonstre.wav', snd_Async or snd_NoDefault);

       9:sndPlaySound('Son\EquipeEpee.wav', snd_Async or snd_NoDefault);

       10:sndPlaySound('Son\EquipeArmure.wav', snd_Async or snd_NoDefault);

       11:sndPlaySound('Son\Torture.wav', snd_Async or snd_NoDefault);
  end;
  end
  else
      begin
           case rand of
           0:sndPlaySound('Son\ChansonAmbiance1.wav', snd_Async or snd_NoDefault);
           1:sndPlaySound('Son\ChansonAmbiance2.wav', snd_Async or snd_NoDefault);
      end;

      end;





end;

procedure Logo;
var
  test: text;
  ligne:string;
  nom:string;


begin

  changerTailleConsole(150,45);

  nom :='Image\LogoSkyrim.txt';

  Assign (test, nom);
  Reset (test);



  while not eof (test) do
  begin
    readln(test,ligne);
    writeln(ligne);
    attendre(50);

  end;

  close(test);

  readln;

end;

procedure SkyIUT;
var
  test: text;
  ligne:string;
  nom:string;
  i:integer;
begin

  nom :='Image\banner.txt';

  Assign (test, nom);
  Reset (test);


  i:=0;
  while not (eof (test)) AND (i<11) do
  begin
    readln(test,ligne);
     deplacerCurseurXY(33,5+i);
    writeln(ligne);
    i:=i+1;
    attendre(50);

  end;

  close(test);


end;

procedure Priscilla;
var
  test: text;
  ligne:string;
  nom:string;
  i:integer;
begin

  nom :='Image\Priscilla6.txt';

  Assign (test, nom);
  Reset (test);


  i:=0;
  while not (eof (test)) AND (i<40) do
  begin
    readln(test,ligne);
     deplacerCurseurXY(5,1+i);
    writeln(ligne);
    i:=i+1;
    attendre(20);

  end;

  close(test);


end;

procedure ASCIIdraugr;
var
  test: text;
  ligne:string;
  nom:string;
  i:integer;
begin

  nom :='Image\draugr2.txt';

  Assign (test, nom);
  Reset (test);


  i:=0;
  while not (eof (test)) AND (i<40) do
  begin
    readln(test,ligne);
     deplacerCurseurXY(60,2+i);
    writeln(ligne);
    i:=i+1;
    attendre(20);

  end;

  close(test);


end;

procedure ASCIIgivrepeire;
var
  test: text;
  ligne:string;
  nom:string;
  i:integer;
begin

  nom :='Image\Givrepeire.txt';

  Assign (test, nom);
  Reset (test);


  i:=0;
  while not (eof (test)) AND (i<40) do
  begin
    readln(test,ligne);
     deplacerCurseurXY(60,2+i);
    writeln(ligne);
    i:=i+1;
    attendre(20);

  end;

  close(test);


end;

procedure ASCIIvasard;
var
  test: text;
  ligne:string;
  nom:string;
  i:integer;
begin

  nom :='Image\Vasard.txt';

  Assign (test, nom);
  Reset (test);


  i:=0;
  while not (eof (test)) AND (i<40) do
  begin
    readln(test,ligne);
     deplacerCurseurXY(60,2+i);
    writeln(ligne);
    i:=i+1;
    attendre(20);

  end;

  close(test);


end;

procedure ASCIIragnard;
var
  test: text;
  ligne:string;
  nom:string;
  i:integer;
begin

  nom :='Image\Ragnard.txt';

  Assign (test, nom);
  Reset (test);


  i:=0;
  while not (eof (test)) AND (i<40) do
  begin
    readln(test,ligne);
     deplacerCurseurXY(60,2+i);
    writeln(ligne);
    i:=i+1;
    attendre(20);

  end;

  close(test);


end;

procedure ASCIIgardienAubetoile;
var
  test: text;
  ligne:string;
  nom:string;
  i:integer;
begin

  nom :='Image\Garde2.txt';

  Assign (test, nom);
  Reset (test);


  i:=0;
  while not (eof (test)) AND (i<40) do
  begin
    readln(test,ligne);
     deplacerCurseurXY(60,1+i);
    writeln(ligne);
    i:=i+1;
    attendre(20);

  end;

  close(test);
end;

procedure ASCIIesprit;
var
    test: text;
  ligne:string;
  nom:string;
  i:integer;
begin

  nom :='Image\esprit.txt';

  Assign (test, nom);
  Reset (test);


  i:=0;
  while not (eof (test)) AND (i<40) do
  begin
    readln(test,ligne);
     deplacerCurseurXY(60,1+i);
    writeln(ligne);
    i:=i+1;
    attendre(20);

  end;

  close(test);
end;





procedure pageAccueil;
begin


  changerTailleConsole(150,45); //changer la taille de la console

  dessinerCadreXY(0,2,149,45,double,15,0);//Cadre contour console

  dessinerCadreXY(30,3,123,15,double,15,0);
  dessinerCadreXY(30,4,123,14,double,15,0);
  dessinerCadreXY(28,3,30,15,double,15,0);
  dessinerCadreXY(123,3,125,15,double,15,0);

  SkyIUT;


  dessinerCadreXY(50,18,100,23,double,15,0);    //
  dessinerCadreXY(50,33,100,38,double,15,0);    // quitter







  deplacerCurseurXY(73,20);
  writeln('Jouer ');



  dessinerCadreXY(50,25,100,30,double,15,0);
  deplacerCurseurXY(71,27);
  writeln('Charger ');

  deplacerCurseurXY(71,35);
  writeln('Quitter ');

  deplacerCurseurXY(63,40);
  writeln('Que souhaitez vous faire ? ');

  deplacerCurseurXY(75,42);
  readln(choixMenu);
  if choixMenu = 'jouer' then squeletteRace
  else if choixMenu = 'charger' then chargement
  else halt;

end;

procedure pageUN;
begin
  son(4,0);
  position:='Porte de la ville de Blancherive';
  texte1:='bienvenue dans SKY IUT, pour choisir un lieu taper 1, 2 ou 3 et pour acceder a l inevntaire taper M1, M2, ...';
  texte2:='';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Entrer dans BlancheRive';
  rep2:='';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=0;
            tempsM:=5;
            temps(tempsM,tempsH);
            pageBlancherive;
            end;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageBlancherive;

  end;
end;


procedure pageBlancherive;

begin

  positionVille:=1;
  son(1,1);
  position:='Blancherive';
  texte1:='Bienvenue dans la ville de Blancherive, C est ici que votre aventure commence.';
  texte2:='Il y a l air d y avoir un magasin au loin, il y a peut etre des armures et des armes.';
  texte3:='Il vous entendez des personnes chanter, c est sans doute une taverne';
  texte4:='';
  texte5:='';
  rep1:='1/ Allez au magasin';
  rep2:='2/ Parler au vieillard sur le banc';
  rep3:='3/ Se rendre dans la taverne';
  rep4:='4/ Parler au garde';
  if voirFemme=TRUE then rep5:='5/ Suivre les cris';

  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=0;
            tempsM:=5;
            temps(tempsM,tempsH);
            if (heure > 8) and (heure < 18) then magasin
               else
                 begin
                 squelette;
                 deplacerCurseurXY(12,13);
                 writeln('Le magasin est ferme !');
                 deplacerCurseurXY(12,14);
                 writeln('Il est ouvert entre 8h et 18h toute la journee');

                 attendre(3000);

                 pageBlancherive;
                 end;
            end;
       '2': begin
            tempsH:=0;
            tempsM:=5;
            temps(tempsM,tempsH);
            pageVieux;
            end;
       '3': begin
            tempsH:=0;
            tempsM:=5;
            temps(tempsM,tempsH);
            pageTaverne;
            end;

       '4':gardeBlancherive;
       '5': pageEgout;
       '7':son(1,1);

       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageBlancherive;

  end;

end;

procedure pageVieux;
begin

  position:='Blancherive';
  texte1:='Bonjour voyageur, vous me semblez nouveau ici n''est ce pas';
  texte2:='je tiens à vous prévenir de faire attention, un dragon se rapproche pour anéantir notre monde';
  texte3:='1/ Allez à la ville voisine';
  texte4:='';
  texte5:='';
  rep1:='1/ Se rendre vers Morthal';
  rep2:='2/ retourner se ballader';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '2': begin
            tempsH:=0;
            tempsM:=5;
            temps(tempsM,tempsH);
            pageBlancherive;
            end;

       '1': begin
            tempsH:=0;
            tempsM:=20;
            temps(tempsM,tempsH);
            conditonQueteDragon:=TRUE;
            choixCombat:=1;
            debutCombat;
            end;


       end;
    while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageVieux;

  end;

end;


procedure pageMorthal;
begin


  positionVille:=2;
  position:='Morthal';
  texte1:='Vous voilà arriver dans la sombre ville de Morthal, anéanti par la puissance d''un dragon';
  texte2:='Vous remarquer une jeune femme allonger au sol respirant à peine';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Parler a la jeune femme';
  rep2:='';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': pageJeuneFemme;



       end;
    while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageMorthal;

  end;

end;

procedure pageJeuneFemme;
begin


  voirFemme:=TRUE;
  position:='Morthal';
  texte1:='Vous la voyez à terre, respirant à peine, essayant de dire quelque mot. (vous vous raprocher pour mieux entendre)';
  texte2:='Elle vous dit : "On v...v..vous mens, rend..rendez vous a blan... ';
  texte3:='Elle est morte';
  texte4:='';
  texte5:='';
  rep1:='1/ Aller plus loin dans la ville pour essayer d''en savoir plus';
  rep2:='2/ Retourner a Blancherive';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': pageMorthalSuite;
       '2': pageForet;


       end;
    while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageJeuneFemme;

  end;



end;

procedure pageMorthalSuite;
begin

  position:='Morthal';
  texte1:='Vous ne voyez rien de plus que des cadavres et des maisons en cendre';
  texte2:='';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Rebrousser chemin';
  rep2:='2/ Se suicider plutôt que de vivre dans un tel monde';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': pageJeuneFemme;
       '2': halt;


       end;
    while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageMorthalSuite;

  end;



end;

procedure pageEgout;
begin



  position:='Egout de Blancherive';
  texte1:='Il fait très sombre';
  texte2:='Vous appercevez des flammes, c''est le dragon';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Attaquer';
  rep2:='2/ S enfuir';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;

  case choix of
       '1': begin
            choixCombat:=5;
            debutCombat;
            end;
       '2': begin
            choixCombat:=5;
            debutCombat;
            end;

       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageBlancherive;

  end;

end;

procedure pageTaverne;
begin
  son(3,0);

  position:='Taverne de Blancherive';
  texte1:='OH, Bienvenue dans la taverne, viens te rechauffer au coin du feu.';
  texte2:='Il y a une jeune femme qui chante devant un public enjoué';
  texte3:='Vous remarquer un étrange personnage';
  texte4:='';
  texte5:='';
  rep1:='1/ Se reposer';
  rep2:='2/ Ecouter la jeune femme chanter';
  rep3:='3/ Parler à l''étrange personnage au coin du bar';
  rep4:='4/ Sauvegarder';
  rep5:='5/ Sortir de la taverne';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=1;
            tempsM:=0;
            temps(tempsM,tempsH);
            pageRepos;
            end;
       '2': begin
            squelette;
            menuPersonnage;
            deplacerCurseurXY(50,13);
            effacerEcran;
            Priscilla;
            son(1,0);
            readln;
            end;
       '3': begin
            tempsH:=0;
            tempsM:=10;
            temps(tempsM,tempsH);
            conditionVoyageur:=TRUE;
            pageVoyageur;
            end;
       '4':sauvegarder;
       '5': begin
            tempsH:=0;
            tempsM:=5;
            temps(tempsM,tempsH);
            pageBlancherive;
            end;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageTaverne;

  end;

end;

procedure pageVoyageur;

begin

  position:='Taverne de Blancherive';
  texte1:='Vous : Bonjour voyageur, Que faite vous dans notre ville?';
  texte2:='Etrange personnage : je m''appele Gerald et je suis spécialiste dans l''alchimie';
  texte3:='';
  //texte4:='';
  texte5:='';
  rep1:='1/ Retourner dans la taverne';
  if conditionVoyageur=TRUE then rep2:='2/ Soudoyer le voyageur pour obtenir la formule de la diacétylmorphine(50 Septims)'
  else rep2:='';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '2': begin
            if personnage.gold<50 then
            begin
            squelette;
                 deplacerCurseurXY(12,13);
                 writeln('Mes services ne sont pas gratuit');


                 attendre(2000);

                 pageTaverne;
                 end
            else
            begin
            personnage.gold:=personnage.gold-50;
            texte4:='La formule est C21 H23 NO5';
            conditionVoyageur:=FALSE;
            pageVoyageur;
            end;
            end;
       '1': pageTaverne;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageTaverne;

  end;

end;

procedure gardeBlancherive;
begin
  texte1:='Je suis un garde de Blancherive';
  texte2:='Que voulez vous ?';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Demander de info sur le dragon';
  rep2:='2/ Retourner se balader';
  rep3:='';
  rep4:='';

  squelettePage;
  case choix of
       '1': begin
            texte1:='JE VOUS ARRETE POUR TRAHISON !';
            texte2:='';
            squelettePage;
            pagePrisonQuete;
            end;
       '2': pageBlancherive;

       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       gardeBlancherive;

end;

end;

procedure pageRepos;
begin
  squelette;
  menuPersonnage;
  deplacerCurseurXY(12,12);
  writeln('Zzzzzzzz');

  attendre(5000);

  regain;

  pageTaverne;


end;

procedure pageForet;
begin



  position:='Foret de Blancherive';
  texte1:='Vous voilà arrivé dans une forêt à la sortie de Blancherive';
  texte2:='Vous voyez une ville magnifique au loin';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Continuer votre route vers Morthal';
  rep2:='2/ Se rendre dans cette mysterieuse ville';
  rep3:='3/ Allez a Blancherive';
  rep4:='4/Prison de Markarth';
  rep5:='';
  rep6:='';
  squelettePage;

  case choix of
       '1': begin
            tempsH:=0;
            tempsM:=20;
            temps(tempsM,tempsH);
            choixCombat:=6;
            debutCombat;
            end;

       '2': begin
            tempsH:=0;
            tempsM:=20;
            temps(tempsM,tempsH);
            choixCombat:=3;
            debutCombat;

            end;
       '3': begin
            tempsH:=0;
            tempsM:=10;
            temps(tempsM,tempsH);
            pageBlancherive;
            end;
       '4':begin
            tempsH:=0;
            tempsM:=10;
            temps(tempsM,tempsH);
            prison;
            end;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageForet;

  end;

end;

procedure pagePorteAubetoile;
begin
  positionVille:=4;
  position:='Porte de la ville d Aubetoile';
  texte1:='Vous voilà arriver devant la ville de Aubetoile';
  texte2:='La ville est protegé par une immense muraille tout autour de la ville';
  texte3:='Un garde protège la porte principale';
  texte4:='';
  texte5:='';
  rep1:='1/ Interroger le garde';
  rep2:='2/ Attaquer le garde';
  rep3:='3/ Rebrousser chemin';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=0;
            tempsM:=10;
            temps(tempsM,tempsH);
            pageEquation;
            end;
       '2': begin
            tempsH:=0;
            tempsM:=40;
            temps(tempsM,tempsH);
            choixCombat:=2;
            debutCombat;

            end;
       '3':begin
            tempsH:=0;
            tempsM:=15;
            temps(tempsM,tempsH);
            pageForet;
            end;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pagePorteAubetoile;

  end;
end;

procedure pageEquation;
begin

  positionVille:=4;
  position:='Porte de la ville de Aubetoile';
  texte1:='Vous êtes devant la Grande ville de Aubetoile';
  texte2:='Qui c''est developpé grâce à sa grande culture scientifique.';
  texte3:='Pour pouvoir rentrée, il faut montrée ses connaissances.';
  texte4:='Quelle est la formule brut chimique de la diacétylmorphine';
  texte5:='';
  rep1:='1/ C2 H6 O ';
  rep2:='2/ C21 H30 O2';
  rep3:='3/ C21 H23 NO5';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '3':pageAubetoile;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageEquation;

  end;
end;

procedure pageAubetoile;
begin

  positionVille:=4;
  position:='Aubetoile';
  texte1:='Bienvenue à Aubetoile';
  texte2:='Il y a un atelier d''alchimiste sur votre droite.';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Se rendre à l''atelier d''alchimiste';
  rep2:='2/ Quitter la ville vers Forthiver';
  rep3:='3/ Quitter la ville vers Blancherive';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=0;
            tempsM:=5;
            temps(tempsM,tempsH);

            if (heure > 10) and (heure < 16) then pageAlchimiste
               else
                 begin
                 squelette;
                 deplacerCurseurXY(12,13);
                 writeln('L''atelier est fermé !');
                 deplacerCurseurXY(12,14);
                 writeln('Il est ouvert entre 10h et 16h toute la journée');

                 attendre(3000);

                 pageAubetoile;
                 end;
            end;
       '2': begin
            tempsH:=0;
            tempsM:=20;
            temps(tempsM,tempsH);
            pageMarais;
            end;
       '3': begin
            tempsH:=0;
            tempsM:=15;
            temps(tempsM,tempsH);
            pageForet;
            end;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageAubetoile;

  end;
end;

procedure pageMarais;
begin


  position:='Marais';
  texte1:='Vous voilà arrivé dans le marais';
  texte2:='La journée est plutôt calme, mais faite attention à la tombée de la nuit';
  texte3:='Vous remarquer une île volante au loin, celà semble être la ville de Forthiver dont tous le monde parle';
  texte4:='Vous entendez des vagues, c''est sans doute une ville cotiere';
  texte5:='';
  rep1:='1/ Se rendre a Aubetoile';
  rep2:='2/ Se rendre a Forthiver';
  rep3:='3/ Se rendre a Vendeaume';
  rep4:='4/ Attendre la nuit';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=0;
            tempsM:=20;
            temps(tempsM,tempsH);
            pagePorteAubetoile;
            end;
       '2': begin
            tempsH:=0;
            tempsM:=15;
            temps(tempsM,tempsH);
            pageSousIle;
            end;
       '3': begin
            tempsH:=0;
            tempsM:=15;
            temps(tempsM,tempsH);
            pageVendeaume;
            end;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageMarais;

  end;
end;

procedure pageSousIle;
begin

  positionVille:=5;
  position:='Sous l''île volante de Forhiver';
  texte1:='Vous voilà devant l''île volante de Forthiver';
  texte2:='Un fantome en armure apparait soudainement';
  texte3:='Pour pouvoir rentrer dans cette ville, il faut pouvoir évader son esprit';
  texte4:='';
  texte5:='';
  rep1:='1/ Evader son esprit';
  rep2:='2/ Interroger le fantome';
  rep3:='3/ Retourner dans le marais';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=1;
            tempsM:=5;
            temps(tempsM,tempsH);
            deplacerCurseurXY(12,19);
            writeln('L''esprit vous attaque par surprise');
            attendre(2000);
            choixCombat:=4;
            debutCombat;
            end;


       '3':begin
            tempsH:=0;
            tempsM:=5;
            temps(tempsM,tempsH);
            pageMarais;
            end;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageSousIle;

  end;
end;

procedure pageForthiver;
begin

  positionVille:=5;
  position:='Forhiver';
  texte1:='Bienvenue à Forthiver, ville spécialisée dans la création d''arme et d''armure.';
  texte2:='Grâce à sa puisssante forge qui tire son énergie du coeur du soleil';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Se rendre à la forge';
  rep2:='2/ ';
  rep3:='3/ Retourner dans le marais';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=0;
            tempsM:=5;
            temps(tempsM,tempsH);
            pageForge;
         end;

       '2':begin
            tempsH:=1;
            tempsM:=10;
            temps(tempsM,tempsH);
            pageMarais;
            end;


  end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageForthiver;

  end;
end;

procedure pageVendeaume;
begin

  positionVille:=6;
  position:='Vendeaume';
  texte1:='Vous voilà arriver dans la ville de Vendeaume réputer pour son immense port.';
  texte2:='Elle a fait sa richesse grâce à l''importation de minerai provenant de la Falaise';
  texte3:='C''est une ville riche et puissante, il y a un lieux pour se reposer mais il semble payant';
  texte4:='';
  texte5:='';
  rep1:='1/ Se rendre au port';
  rep2:='2/ Se rendre au cabaret';
  rep3:='3/ Retourner au marais';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=0;
            tempsM:=10;
            temps(tempsM,tempsH);
            pagePortVendeaume;
            end;
       '2': begin
            tempsH:=0;
            tempsM:=5;
            temps(tempsM,tempsH);
            pageCabaret;
            end;
       '3': begin
            tempsH:=0;
            tempsM:=15;
            temps(tempsM,tempsH);
            pageMarais;
            end;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageVendeaume;

  end;
end;

procedure pagePortVendeaume;
begin

  positionVille:=6;
  position:='Port de Vendeaume';
  texte1:='Le port de Vendeaume est réputé pour le trafic de matiere miniere';
  texte2:='Vous pouvez demander à un de ces marins de vous conduire à la Falaise';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Parler a un marin';
  rep2:='2/ Retourner au centre de Vendeaume';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=0;
            tempsM:=5;
            temps(tempsM,tempsH);
            pageMarin;
            end;
       '2': begin
            tempsH:=0;
            tempsM:=10;
            temps(tempsM,tempsH);
            pageVendeaume;
            end;



       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pagePortVendeaume;

  end;
end;

procedure pageCabaret;
begin


  position:='Cabaret de Vendeaume';
  texte1:='Bienvenue dans le grand cabaret de Vendeaume';
  texte2:='Vous passerez une nuit inoubliable';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Se reposer (60 septims)';
  rep2:='2/ Regarder le spectacle(30 septims)';//A faire ????????????????????????????????????????????
  rep3:='3/ Sortir du Cabaret';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=1;
            tempsM:=10;
            temps(tempsM,tempsH);
            if personnage.gold<60 then
            begin
            squelette;
                 deplacerCurseurXY(12,13);
                 writeln('Vous n''avez pas assez d''argent !');


                 attendre(2000);

                 pageCabaret;
                 end
            else
            begin
            squelette;
            deplacerCurseurXY(12,12);
            writeln('Zzzzzzzz');
            if personnage.gold >10 then personnage.gold:=personnage.gold-10
               else personnage.gold:=0;

            attendre(10000);

            regain;
            squelette;
            deplacerCurseurXY(12,12);
            writeln('Vous vous réveiller et vous remarquez qu''il vous manque des septimes');


            pageCabaret;
            end;
            end;
       {'2': begin
            tempsH:=0;
            tempsM:=15;
            temps(tempsM,tempsH);
            pageSousIle;
            end;}
       '3': begin
            tempsH:=0;
            tempsM:=15;
            temps(tempsM,tempsH);
            pageVendeaume;
            end;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageCabaret;

  end;
end;

procedure pageMarin;
begin


  position:='Port de Vendeaume';
  texte1:='Bienvenue voyageur, que puis-je faire pour t''aider ?';
  texte2:='';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Se rendre à la Falaise (Payer 100Septims)';
  rep2:='2/ S''excuser et retourner au port';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=2;
            tempsM:=5;
            temps(tempsM,tempsH);
            if personnage.gold>=100then personnage.gold:=personnage.gold-100
               else
               begin
                    choixCombat:=7;
                    debutCombat;
               end;

            pageFalaise;
            end;
       '2': begin
            tempsH:=0;
            tempsM:=5;
            temps(tempsM,tempsH);
            pagePortVendeaume;
            end;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageMarin;

  end;
end;

procedure pageFalaise;
begin


  position:='Falaise';
  texte1:='Vous voilà arriver dans une ville détruite par la surexploitation';
  texte2:='Vous apercevez la fameuse mine où vous trouverez tous les metaux necessaire';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Se rendre à la Mine';
  rep2:='2/ Retourner à Vendeaume';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=0;
            tempsM:=15;
            temps(tempsM,tempsH);
            pageMine;
            end;
       '2': begin
            tempsH:=2;
            tempsM:=5;
            temps(tempsM,tempsH);
            pagePortVendeaume;
            end;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageFalaise;

  end;
end;

procedure pageMine;
var
  nomR:string;
  v:integer;
begin


  position:='Mine de la Falaise';
  texte1:='Vous pouvez miner differentes ressources comme du fer ou de l''argent selon vos compétences de minage';
  texte2:='';
  texte3:='';
  texte4:='';
  texte5:='';
  rep1:='1/ Miner du fer';
  rep2:='2/ Miner de l''argent';
  rep3:='3/ Sortir de la mine';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1': begin
            tempsH:=0;
            tempsM:=15;
            temps(tempsM,tempsH);
            nomR:='Acier|';
            for v := 1 to length(nomR) do tabRessources[v+1,caseR] := nomR[v];
            caseR := caseR+1;
            PageMine;
            end;
       '2':begin
            tempsH:=0;
            tempsM:=15;
            temps(tempsM,tempsH);
            if lvlForge<1 then
            begin
            deplacerCurseurXY(12,16);
            writeln('Vous n avez pas le niveau necessaire, il faut etre niveau 2');
            attendre(1000);
            pageMine;
            end
            else
            begin
                 nomR:='Argent|';
                 for v := 1 to length(nomR) do tabRessources[v+1,caseR] := nomR[v];
                 caseR := caseR+1;
                 PageMine;
            end;


            end;
       '3': begin
            tempsH:=2;
            tempsM:=5;
            temps(tempsM,tempsH);
            pagePortVendeaume;
            end;


       end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pageMine;

  end;
end;

procedure chargement;
var charger,ligne:string;
    test1 : text;
    i,j,stocki,m,k,n:integer;
    test2:string;
    caractere:char;
    moisSauvegarde:moisTamrielien;
begin
  effacerEcran;
  test2:='                             ';


  dessinerCadreXY(19,6,36,8,double,15,0);
  deplacerCurseurXY(20,7);
  writeln('Votre sauvegarde');

  dessinerCadreXY(19,9,50,15,simple,15,0);
  deplacerCurseurXY(20,10);
  writeln('Nom ');

  deplacerCurseurXY(20,11);
  writeln('Race ');

  deplacerCurseurXY(20,12);
  writeln('Point de vie');

  deplacerCurseurXY(20,13);
  writeln('Point de mana');

  deplacerCurseurXY(20,14);
  writeln('Septim ');

  deplacerCurseurXY(10,40);
  writeln('Charger la sauvegarde');




       assign (test1, 'Sauvegarde.txt');
       reset(test1);


       i:=1;
       while not eof(test1) and (i<6) do
       begin
            readln(test1, ligne);
            deplacerCurseurXY(35,9+i);        //affiche les caractéristique
            writeln(ligne);

            i:=i+1
       end;

       {dessinerCadreXY(59,7,100,20,simple,15,0);
       deplacerCurseurXY(80,8);
       writeln('Epée');
       dessinerCadreXY(59,9,100,20,simple,15,0);
       while not eof(test1) and (i<16) do
       begin
            readln(test1, ligne);
            deplacerCurseurXY(60,10+i-6);        //affiche les épée sauvegarder
            writeln(ligne);

            i:=i+1
      end;}

       close(test1);



  deplacerCurseurXY(35,40);
  readln(charger);
  if (charger='oui') then
  begin
       assign (test1, 'Sauvegarde.txt');
       reset(test1);

       i:=1;
       while not eof(test1) or (i<47) do
       begin
            readln(test1, ligne);
            //deplacerCurseurXY(35,14+i);
            //writeln(ligne);
            case i of
                 1:personnage.nomPerso:=ligne;
                 2:personnage.nomRacePerso:=ligne;
                 3:(personnage.PDV):=StrToFloat(ligne);    //rentre les info du joueur
                 4:personnage.PM:=StrToInt(ligne);
                 5:personnage.gold:=StrToInt(ligne);

            end;

            if (i>=6) AND (i<16) then          //condition du tableau épée
            begin
                 //stocki:=i;
                 test2:=ligne;
                 {deplacerCurseurXY(80,25);
                 writeln(i);
                 deplacerCurseurXY(80,25);
                 writeln(test2);
                 readln;}
                 //for j := 0 to 10 do
                 //begin

                     for m := 0 to 29 do
                     begin
                         caractere:=test2[m+1];
                         tabEpee[m,i-6]:=caractere;
                         //deplacerCurseurXY(80,27);
                         //writeln(m);
                         //readln;
                     end;
                 //end;
                 for k := 0 to 9 do
                 begin
                 for n := 0 to 29 do
                 begin
                 deplacerCurseurXY(85+n,31+k);
                  writeln(tabEpee[n,k]);
                  end;
                // i:=18;
                  end;

            end;

            if (i>=16) AND (i<26) then    //condition du tableau armure
            begin
                 test2:=ligne;
                     for m := 0 to 29 do
                     begin
                         caractere:=test2[m+1];
                         tabArmure[m,i-16]:=caractere;
                     end;
                 for k := 0 to 9 do
                 begin
                 for n := 0 to 29 do
                 begin
                 deplacerCurseurXY(85+n,31+k);
                  writeln(tabArmure[n,k]);
                  end;

                  end;

            end;

            if (i>=26) AND (i<37) then    //condition du tableau épée
            begin
                 test2:=ligne;
                     for m := 0 to 29 do
                     begin
                         caractere:=test2[m+1];
                         tabRessources[m,i-26]:=caractere;
                     end;
                 //end;
                 for k := 0 to 9 do
                 begin
                 for n := 0 to 29 do
                 begin
                 deplacerCurseurXY(85+n,31+k);
                  writeln(tabRessources[n,k]);
                  end;
                // i:=18;
                  end;

            end;

            if (i>=37) AND (i<48) then    //condition du tableau épée
            begin
                 test2:=ligne;
                     for m := 0 to 29 do
                     begin
                         caractere:=test2[m+1];
                         tabPotions[m,i-37]:=caractere;
                     end;
                 for k := 0 to 9 do
                 begin
                 for n := 0 to 29 do
                 begin
                 deplacerCurseurXY(85+n,31+k);
                  writeln(tabPotions[n,k]);
                  end;
                // i:=18;
                  end;

            end;


            //i:=stocki;
            i:=i+1;
       end;
       positionVille:=StrToInt(ligne);
       heure:=StrToInt(ligne);
       minute:=StrToInt(ligne);
       jour:=StrToInt(ligne);
       (mois.nom):=Primetoile;
       mois.nbjour:=StrToInt(ligne);
       annee:=StrToInt(ligne);
       xpAlchi:=StrToInt(ligne);
       xpForge:=StrToInt(ligne);
       lvlAlchi:=StrToInt(ligne);
       lvlForge:=StrToInt(ligne);

       close(test1);



       {deplacerCurseurXY(50,30);
       writeln(personnage.nomPerso);
       readln;
       writeln(personnage.nomRacePerso);
       readln;
       writeln(personnage.PDV);
       readln;
       writeln(personnage.PM);
       readln;
       writeln(personnage.gold);
       readln;
       writeln(positionVille);}

       readln;
       pageTaverne;

  end
  else pageAccueil;

end;

procedure sauvegarder;
var
  test1 : text;
  PDV,i,j,k:integer;
  ligne:string;
  ligneInter:char;

begin

  assign (test1, 'Sauvegarde.txt');
  rewrite(test1);

  PDV:=round(personnage.PDV);

  writeln(test1, (personnage.nomPerso));
  writeln(test1, (personnage.nomRacePerso));
  writeln(test1, (PDV));
  writeln(test1, (personnage.PM));
  writeln(test1, (personnage.gold));
  //writeln(test1, (caseinventaire));

  //ligneInter:=' ';
  ligne:='                             ';
  i:=0;
  while (i<10) do
  begin
       for j := 0 to 29 do
       begin
            ligneInter:=tabEpee[j,i];             //sauvegarde les épées
            ligne[j+1]:=ligneInter;
       end;
       writeln(test1, ligne);
       i:=i+1;

  end;

  ligne:='                             ';
  i:=0;
  //for i := 0 to 9 do
  while (i<10) do
  begin
       for j := 0 to 29 do
       begin
            ligneInter:=tabArmure[j,i];          //sauvegarde les armures
            ligne[j+1]:=ligneInter;
            //k:=k+1;
       end;
       i:=i+1;
       writeln(test1, ligne);
  end;

  ligne:='                             ';
  i:=0;
  //for i := 0 to 9 do
  while (i<11) do
  begin
       for j := 0 to 29 do
       begin
            ligneInter:=tabRessources[j,i];         //sauvegarde les potions
            ligne[j+1]:=ligneInter;
            //k:=k+1;
       end;
       i:=i+1;
       writeln(test1, ligne);
  end;

  ligne:='                             ';
  i:=0;
  //for i := 0 to 9 do
  while (i<11) do
  begin
       for j := 0 to 29 do
       begin
            ligneInter:=tabPotions[j,i];
            ligne[j+1]:=ligneInter;
            //k:=k+1;
       end;
       i:=i+1;
       writeln(test1, ligne);
  end;

  writeln(test1, (positionVille));

  writeln(test1, (heure));
  writeln(test1, (minute));
  //writeln(test1, (jour));
  writeln(test1, (mois.nom));
  writeln(test1, (mois.nbjour));
  writeln(test1, (annee));
  writeln(test1, (xpAlchi));
  writeln(test1, (xpForge));
  writeln(test1, (lvlAlchi));
  writeln(test1, (lvlForge));


  close(test1);

  readln;



end;

end.

