unit UTestArray;

// https://www.freepascal.org/docs-html/ref/refsu14.html
interface
uses
  Classes, SysUtils;

type
  TArr1D = array of  Int64;
  TArr2D = array of array of Int64;

procedure test_array;
procedure write2DArray(dat:TArr2D);

function test_arr1:TArr2D;
function test_arr2:TArr2D;
function test_arr3:TArr2D;
function test_arr4:TArr2D;
function test_arr5:TArr2D;
function test_arr6:TArr2D;


implementation

function test_arr1:TArr2D;
  var
    i, n:integer;
    dat_:TArr2D;
begin
   // test_array;
   Writeln('SetLength(dat_,3)');
   SetLength(dat_,3);
   writeln('Low =',Low(dat_));
   writeln('High =',High(dat_));        writeln;
   n:=2;
   // задание исходных данных
   Writeln('задание исходных данных');
   For i:= Low(dat_) to High(dat_) do
       begin
        SetLength(dat_[i],2);
//        writeln('Low(dat_[',i,']) = ',Low(dat_[i]));
//        writeln('High(dat_[',i,']) = ',High(dat_[i]));
        dat_[i,0]:=1;
        dat_[i,1]:=n;
        n :=n + 1;
        writeln;
       end;
    Result:=dat_;
  end;

function test_arr2:TArr2D;
  begin
    Result := [[1, 3], [5, 3]]
  end;

function test_arr3:TArr2D;
  begin
    Result := [[1,2], [2,9], [3,18], [4,24], [6,48]]
  end;

function test_arr4:TArr2D;
  begin
    Result := [[1, 84], [1, 27055], [1, 1359351420]]
  end;


function test_arr5:TArr2D;
  begin
    Result := []
  end;

function test_arr6:TArr2D;
  begin
    Result := [[600000,1300000], [18700000,131000000], [3100000,4100000]]
  end;


procedure test_array;
Type
  TIntegerArray = Array of Integer;
  TIntegerArrayArray = Array of TIntegerArray;
var
  A : TIntegerArrayArray;
  i,j:integer;
begin
  A:=TIntegerArrayArray.Create(TIntegerArray.Create(1,2,3),
                                 TIntegerArray.Create(4,5,6),
                                 TIntegerArray.Create(7,8,9));
  Writeln('Length ',length(A));
  for i:=0 to 2 do
   begin
     for j:=0 to 2 do
        Write(A[i,j],' ');
   writeln;
   end;
  readln;
end;

procedure write2DArray(dat:TArr2D);
var
  i,j:integer;
begin //-- procedure
Writeln('write2DArray()');
Writeln('Low(dat) = ',Low(dat));
Writeln('High(dat) = ',High(dat));
for i:= Low(dat) to High(dat) do
 begin  //-- cycle i
   for j:=Low(dat[i]) to High(dat[i]) do
      Write(dat[i,j],' ');
 Writeln;
 end;   //-- cycle i
 readln;
end;  //-- procedure



end.

