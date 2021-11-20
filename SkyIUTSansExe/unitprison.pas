unit unitPrison;

{$codepage utf8}

interface

uses
  Classes, GestionEcran, SysUtils;

procedure prison;
procedure prisonCombat;
procedure pagePrisonQuete;
procedure pagePrisonQuete2;
procedure pagePrisonnierInfo;
procedure combatRagnard;
procedure pageVictoire;

implementation

uses
 unitCombat, unitmagasin, unitInventaire, unitRace, unitSquelette,unitPersonnage,unitQuete,MMSystem,unitAlchimiste,unitCarte,unitPage;

var
  monstre:monster;
  attaqueMonstre1:attaqueM;
  attaqueMonstre2:attaqueM;
  varAttaquePersonnage:string;
  varAttaqueMonstre:string;
  //choixRandom:integer;
  choixAttaqueP:integer;
  choixAttaqueM:integer;
  nomR : string;
  caseR2,testR : integer;


procedure prison;
begin
  position:='Prison de Markarth';
  positionVille:=9;
  squelette;
  menuPersonnage;

  Texte1:='Vous voulez quoi !';
  Texte2:='';
  Texte3:='';
  Texte4:='';
  Texte5:='';

  rep1:='1/ Combattre';
  rep2:='';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';

  case choix of
       '1':prisonCombat;
  end;

  squelettePage;
  readln;
end;

procedure prisonCombat;
begin

  squelette;
  menuPersonnage;



end;

procedure pagePrisonQuete;
begin
  position:='Prison de Markarth';
  positionVille:=9;
  squelette;
  menuPersonnage;
  personnage.PDV:=100-75;
  personnage.gold:=0;

  Texte1:='Gardien de prison : Vous allez pourrir ici toute votre vie,';
  Texte2:='Donc je peux me permettre de prendre votre or';
  Texte3:='';
  Texte4:='Prisonnier : Vous avez demander pour le dragon n''est ce pas ?';
  Texte5:='Il n''autorise personne à parler du dragon';

  rep1:='1/ S''échapper';
  rep2:='2/ Demander des info au prisonnier';
  rep3:='3/ Ecouter la cellule voisine';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1':pagePrisonQuete2;
       '2':pagePrisonnierInfo;
       '3':son(11,0);
  end;
  while conditionQuitter<>'1' do
  begin
       utiliseMenuPersonnage(choix);
       pagePrisonQuete;
end;

end;

procedure pagePrisonQuete2;
begin
  squelette;
  menuPersonnage;

  Texte1:='Vous vous faites prendre en train d''essayer de sortir';
  Texte2:='Gardien de prison : Eh toi ! Tu veux sortir ?';
  Texte3:='Il va falloir te battre pour ça';
  Texte4:='Affronte le ragnard qu''on a capturer, si tu le tue tu sors';
  Texte5:='';

  rep1:='';
  rep2:='';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;
  combatRagnard;
end;

procedure pageVictoire;
begin
  squelette;
  menuPersonnage;
  Texte1:='Il va mettre du temps à s''en remettre';
  Texte2:='Vous avez gagner donc vous êtes libre';
  Texte3:='';
  Texte4:='';
  Texte5:='';

  rep1:='';
  rep2:='';
  rep3:='';
  rep4:='';
  rep5:='';
  rep6:='';
  squelettePage;

  prison;
end;

procedure pagePrisonnierInfo;
begin
  squelette;
  menuPersonnage;

  Texte1:='Que veux tu savoir ?';
  Texte2:='';
  Texte3:='';
  Texte4:='';
  Texte5:='';

  rep1:='1/ Depuis quand le dragon est arriver ?';
  rep2:='2/ Pourquoi les gardes m''ont enfermer ?';
  rep3:='3/ Un moyen de sortir ?';
  rep4:='4/ Sortir';
  rep5:='';
  rep6:='';
  squelettePage;
  case choix of
       '1':begin
            Texte1:='Le dragon est apparu il y une dizaine d''année';
            Texte2:='On le voit pas souvent même s''il vient de raser une ville';
            rep1:='';
            rep2:='';
            rep3:='';
            rep4:='';
            squelettePage;
            pagePrisonnierInfo;
            end;
       '2':begin
            Texte1:='Les garde sont sous les ordres du jarl de Blancherive';
            Texte2:='Tous ceux qui parle du dragon son tabasser, enfermer ou torturer';
            rep1:='';
            rep2:='';
            rep3:='';
            rep4:='';
            squelettePage;
            pagePrisonnierInfo;

       end;
       '3':begin
            Texte1:='Tu ne pourra pas t''évader c''est impossible';
            Texte2:='Le seul moyen c''est de participer au combat organiser par les gardes';
            rep1:='';
            rep2:='';
            rep3:='';
            rep4:='';
            squelettePage;
            pagePrisonnierInfo;
            end;
       '4':pagePrisonQuete;
        end;
        while conditionQuitter<>'1' do

  begin
       utiliseMenuPersonnage(choix);
       pagePrisonQuete;
       end;

     end;

procedure combatRagnard;
begin
  choixCombat:=5;
  debutCombat;


  end;

end.
