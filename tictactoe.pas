program tictactoe;
{
  Simple jeu realise par mohamed Aziz knani
  (incomplet)
}
uses wincrt;

type
  tab = array [1..9] of string;
  
var
  countPartie, scoreJoueur1, scoreJoueur2, i   : integer;
  nomJoueur1, nomJoueur2    : string;
  symJoueur1, symJoueur2, rep    : char;
  bool, tourJoueur1, tourJoueur2   : boolean;
  t                         : tab;
  
procedure joueur(var nom : string; var sym, symJoueur1 : char; nbJoueur : byte) ;
begin
  write('Entrer le nom du joueur ', nbJoueur, ' -> ');
  readln(nom);
  if nbJoueur = 1 then 
    repeat
      write('X ou O -> ');
      readln(sym);
      sym := upCase(sym);
    until (sym = 'X') or (sym = 'O')
  else 
    if symJoueur1 = 'O' then
      sym := 'X'
    else sym := 'O';
end;


procedure jeu(var t : tab; nomJoueur1, nomJoueur2 : string; var scoreJoueur1, scoreJoueur2 : integer;
                                  symJoueur1, symJoueur2 : char; tourJoueur1, tourJoueur2 : boolean);
var
  i, choix : integer;
  cas, e, maj, j   : integer;
  lmd, rck         : string;
  a                : boolean;

function compare(valeur1, valeur2, valeur3 : string) : boolean;
begin
  writeln(valeur1, valeur2, valeur3);
  if (valeur1 <> '') and (valeur2 <> '') and (valeur3 <> '') then
    begin
      if (valeur1 = valeur2) and (valeur1 = valeur3) and (valeur2 = valeur3) then
        compare := true
    end
  else
    compare := false;
end;

procedure affichage(t : tab; scoreJoueur1, scoreJoueur2 : integer);
var
  i, x, y: byte;
  posi, e : integer;
begin
  clrscr;
  write('       ', nomJoueur1, ' : ', scoreJoueur1, ' | ', 
          nomJoueur2, ' : ', scoreJoueur2);
  writeln;
  writeln;
  writeln('---|---|---');
  writeln(' 1 | 2 | 3 ');
  writeln('---|---|---');
  writeln(' 4 | 5 | 6 ');
  writeln('---|---|---');
  writeln(' 7 | 8 | 9 ');
  writeln('---|---|---');
  for i:=1 to 9 do
    begin
      if t[i] <> '' then 
      begin
          case i of
            1..3 : x := 4;
            4..6 : x := 6;
            7..9 : x := 8;
          end;
          case choix of
            1, 4, 7 : y := 2;
            2, 5, 8 : y := 6;
            3, 6, 9 : y := 10;
          end;
        if t[i] = '1' then
          begin
            gotoxy(y, x);
            write(symJoueur1);
            gotoxy(1, 10);
          end
        else
          begin
            gotoxy(y, x);
            write(symJoueur2);
            gotoxy(1, 10);
          end; 
      end;
    end;
end;

begin
  a := true;
  while a do
    begin
      tourJoueur1 := true;
      tourJoueur2 := false;
      affichage(t, scoreJoueur1, scoreJoueur2);
      if tourJoueur1 then
        begin
          repeat
            affichage(t, scoreJoueur1, scoreJoueur2); 
            write(nomJoueur1, ' entrer un nombre entre [1, 9] -> ');readln(choix);
            t[choix] := '1';
            tourJoueur1 := false;
            tourJoueur2 := true;
          until choix in [1..9];
        end;   
      if tourJoueur2 then
        begin
          repeat
            affichage(t, 0, 0);
            write(nomJoueur2, ' entrer un nombre entre [1, 9] -> ');readln(choix);
            t[choix] := '0';
            tourJoueur2 := false;
            tourJoueur1 := true;
          until choix in [1..9];
        end;

    if compare(t[1], t[2], t[3]) or compare(t[4], t[5], t[6]) or compare(t[7], t[8], t[9])
     or compare(t[1], t[4], t[7]) or compare(t[2], t[5], t[8]) or compare(t[3], t[6], t[9])
     or compare(t[1], t[5], t[9]) or compare(t[3], t[5], t[7]) then
       begin
         a := false;
         writeln('Gagne');
       end; 
  {else
    for i:=1 to 9 do
      begin
        str(t[i], rck);
        lmd = lmd + rck;
        if length(lmd) = 9 then
          writeln('Draw'); 
      end; }

   end;
end;

BEGIN
  repeat
    countPartie := countPartie + 1;
    if countPartie = 1 then 
      begin
        joueur(nomJoueur1, symJoueur1, symJoueur1, 1);
        joueur(nomJoueur2, symJoueur2, symJoueur1, 2);
      end;

    jeu(t, nomJoueur1, nomJoueur2, scoreJoueur1, scoreJoueur2, symJoueur1, symJoueur2, tourJoueur1, tourJoueur2);
    write('Une autre partie [Y/n] -> ');
    read (rep); 
    rep := upCase(rep);
    if rep = 'Y' then 
      bool := true
    else bool := false;
  until bool = false ;
END.
