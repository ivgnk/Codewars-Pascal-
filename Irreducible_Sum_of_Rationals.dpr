program Irreducible_Sum_of_Rationals;

{$APPTYPE CONSOLE}

{$R *.res}
// You will have a list of rational numbers in the form
// // lst = [[numer_1, denom_1] , ... , [numer_n, denom_n] ] ,
// where all numbers are positive integers.
// It is necessary to output their sum N/D in irreducible form:
// this means that N and D have only 1 as a common divisor.
// [ [1, 2], [1, 3], [1, 4] ] --> [13, 12]
// 1/2 + 1/3 + 1/4 = 13/12
uses
  utestarray,
  System.SysUtils;

type TNumDen = array [0..1] of Int64;

Var
   dat_:TArr2D;
   i,n:integer;
   res_:TNumDen;

// https://wiki.freepascal.org/Greatest_common_divisor/ru
function greatestCommonDivisor(a, b: Int64): Int64;
var
  temp: Int64;
begin
  while b <> 0 do
  begin
    temp := b;
    b := a mod b;
    a := temp
  end;
  result := a
end;

function Arr_gcd(dat:TArr2D):int64;
  Var
    i:integer;
    g:int64;
    arr: TArr1D;
  begin
    Writeln(length(dat));
    SetLength(arr,length(dat));

    for i := Low(dat) to High(dat) do
      arr[i] := dat[i,1];
    g:=arr[0];
    for i := Low(arr) to High(arr) do
      begin
        g:=greatestCommonDivisor(g,arr[i]);
        Writeln(i,' ', arr[i],' g = ',g);
      end;
    Arr_gcd:=g
  end;


function SumFracts(l: TArr2D): TNumDen;
 var
  i, j:integer;
  sum_, Prod_,  t, gcd_:Int64;
  res1_:TNumDen;
  themod:boolean;
begin
  if Low(l)<High(l)
    then
     begin
      gcd_ := Arr_gcd(l);
    //  Writeln('SumFracts');
      themod:=True;
      For i:= Low(l) to High(l) do
          themod:=themod and (l[i,0] mod gcd_ = 0) and (l[i,1] mod gcd_ = 0);
      if themod
        then
          For i:= Low(l) to High(l) do
            begin
              l[i,0]:=l[i,0] div gcd_;
              l[i,1]:=l[i,1] div gcd_;
            end;
      Prod_ := 1;
      For i:= Low(l) to High(l) do
          begin
    //        writeln(dat_[i,1]);
            Prod_:=Prod_*l[i,1];
          end;
      sum_:=0;
      writeln('Prod = ',Prod_);
      writeln('Cycle sum_');
      For i:= Low(l) to High(l) do
          begin
           t := Prod_ div l[i,1];
           Writeln(i,' ',l[i,0],' ',l[i,0]*t,' ',t);
           sum_:=sum_ + l[i,0]*t;
          end;
      writeln('Sum_ = ',sum_);
      gcd_ := greatestCommonDivisor(Sum_, Prod_);
      writeln('gcd_ = ',gcd_);
      res1_[0] := Sum_ div gcd_;
      res1_[1] := Prod_ div gcd_;
      SumFracts := res1_;
     end
    else
      begin
        res1_[0] := 0;
        res1_[1] := 1;
        SumFracts := res1_;
      end;
end;

begin
   dat_:= test_arr6;
   // checking the source data assignment
   write2DArray(dat_);
   res_:=SumFracts(dat_);
   Writeln('Ответ = ', res_[0],' ',res_[1]);
   readln;
end.

