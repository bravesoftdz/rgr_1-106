unit Unit1;

interface

uses
  Windows, Math, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, TeeProcs, TeEngine, Series, Chart;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit9: TEdit;
    Edit11: TEdit;
    Edit10: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Edit12: TEdit;
    Edit13: TEdit;
    Label23: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Grid1: TStringGrid;
    Graf: TChart;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TForm1Click(Sender: TObject);overload;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin//��������

end;

procedure TForm1.Button3Click(Sender: TObject);
//�����
begin
close;
end;

procedure TForm1.Button2Click(Sender: TObject);
const Nmax = 20;
type
    Tmy = Array[1..Nmax,1..Nmax] of Extended;
    Tmx = Array[1..Nmax] of Extended;
var
mA, mX:Tmx;
mY:Tmy;
xn,Dx,an,ak,Da,b:Extended;
N:integer;
procedure Tab(xn,Dx,an,ak,Da,b:Extended;N:integer; var mA,mX:Tmx; var mY:Tmy);   //��������� �������������
  var
  i,j:integer;
  x,a,lz:Extended;
  begin
  a :=an;
  i:= 1;
  while a<= ak do
    begin
    x:=xn;
    for j:=1 to N do
      begin
      if x > 1 then
           mY[i, j] := Sin(a*x)* Cos(b*x)
      else
          begin
          lz:= a*a + x*x*x*x + b*b;
          mY[i, j] := x*x*sqrt(lz);
      end;
      mX[j]:= x;
      x:= x + Dx;
      end;
    mA[i]:= a;
    a:= a + Da;
    end;
  end;
procedure RezOut(var mA,mX:Tmx;var mY:Tmy);
var I,J:Integer;
begin
for I:= 1 to Nmax do
  begin
  Grid1.Cells[I,0]:= ('A['+IntToStr(I)+'J='+FloatToStr(mA[I]));
  Form1.Graf.Series[0].Clear;
  for J:=1 to Nmax do
    begin
     if (Grid1.ColCount<J+1) then
     Grid1.ColCount:= Grid1.ColCount + 1;
     Grid1.Cells[0,j]:= ('x['+IntToStr(J)+'J='+FloatToStr(Mx[J]));
     Form1.Graf.Series[0].AddXY(Mx[j],My[I,J]);
     Grid1.Cells[I,J]:= FloatToStr(My[I,J]);
    end;
     If (Grid1.RowCount<1) then
        Grid1.RowCount := Grid1.RowCount + 1;
    end;

begin
xn:= StrToFloat(Edit6.Text);
N := StrToInt(Edit7.Text);
Dx:= StrToFloat(Edit8.Text);
an:= StrToFloat(Edit9.Text);
ak:=StrToFloat(Edit10.Text);
Da :=StrToFloat(Edit11.Text);
b:=1;
Tab(xn,Dx,an,ak,Da,b,N,mA,mX,mY);
RezOut(mA,mX,mY);
end;
end;
end.