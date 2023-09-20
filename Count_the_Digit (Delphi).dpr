program Count_the_Digit;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  StrUtils,
  utestarray in 'utestarray.pas';

// Take an integer n (n >= 0) and a digit d (0 <= d <= 9) as an integer.
// Square all numbers k (0 <= k <= n) between 0 and n.
// Count the numbers of digits d used in the writing of all the k**2.
// Implement the function taking n and d as parameters and returning this count.

//n = 10, d = 1
//the k*k are 0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100
//We are using the digit 1 in: 1, 16, 81, 100. The total count is then 4.
//
//The function, when given n = 25 and d = 1 as argument, should return 11 since
//the k*k that contain the digit 1 are:
//1, 16, 81, 100, 121, 144, 169, 196, 361, 441.
//So there are 11 digits 1 for the squares of numbers between 0 and 25.

// https://delphi-help.ru/index.php?option=com_k2&view=item&id=545:kolichestvo-vhozhdeniy-podstroki-v-stroku
function CountPos(const subtext: string; Text: string): Integer;
begin
  if (Length(subtext) = 0) or (Length(Text) = 0) or (Pos(subtext, Text) = 0) then
    Result := 0
  else
    Result := (Length(Text) - Length(StringReplace(Text, subtext, '', [rfReplaceAll]))) div
      Length(subtext);
end;

function NbDig(n, d: Int64): Int64;
 var i:integer;
     ArrI: Array [0..60000] of Int64;
     ArrS: Array [0..60000] of String;
     nn:Int64; // num squares
     nd:Int64; // num integers with d
     ds:string;
begin
  // Calc Squares
  nn:=0;
//  writeln('n=',n);
  for i:=0 to n do
   begin
    ArrI[i]:=i*i;
    ArrS[i]:=IntToStr(ArrI[i]);
    nn:=nn+1;
   end;
  // Calc num integers with digit d
  nd:=0;
  ds:=IntToStr(d);
  for i:=0 to nn do
    if ContainsText(ArrS[i],ds)
     then nd:=nd+CountPos(ds,ArrS[i]);
  NbDig:=nd;
end;

begin
  Writeln('Count_the_Digit');
  Writeln('Result = ',nbDig(5750, 0)); // 4700
  Writeln('Result = ',nbDig(11011, 2)); // 9481
  Writeln('Result = ',nbDig(12224, 8)); // 7733

  readln;
end.
