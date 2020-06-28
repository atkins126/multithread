unit Ex7Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MTUtils, ComCtrls;

type
  TMyThread = class(TThread)
  private
    FResult: Int64;
    FCurrValue: Integer;
    procedure SetProgressParams;
    procedure SetProgressCurrValue;
  public
    MaxValue: Integer;
    procedure Execute; override;
  end;

  TForm1 = class(TForm)
    btnRunInParallelThread: TButton;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    labResult: TLabel;
    edMaxValue: TEdit;
    procedure btnRunInParallelThreadClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FMyThread: TMyThread;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation

{$R *.dfm}

procedure TForm1.btnRunInParallelThreadClick(Sender: TObject);
begin
  // ���������� ���������� �����
  if Assigned(FMyThread) then
    FreeAndNil(FMyThread);

  // ������ ����� � ������ ���������
  FMyThread := TMyThread.Create(True);

  // ���������� ����� ���� � ���� MaxValue
  FMyThread.MaxValue := StrToIntDef(edMaxValue.Text, 0);

  // ���������� ����� ��� ���������� ����������
  FMyThread.Resume;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FMyThread.Free;
end;

{ TMyThread }

procedure TMyThread.Execute;
var
  Res: Int64;
  CurrVal: Integer;
begin
  // ���������� ��������� ���������� ProgressBar1
  Synchronize(SetProgressParams);

  // ��������� ��������� ����������
  Res := 0;
  CurrVal := 0;
  while CurrVal < MaxValue do
  begin
    if Terminated then Break;
    Inc(CurrVal);
    Res := Res + CurrVal;

    if CurrVal mod 10000 = 0 then
    begin // ���������� ��������� ����������� ������ 1 ��� �� 10000
      FCurrValue := CurrVal;
      FResult    := Res;
      Synchronize(SetProgressCurrValue);
    end;
  end;

  // ��������� �������� � ����� ����������
  FCurrValue := CurrVal;
  FResult    := Res;
  Synchronize(SetProgressCurrValue);
end;

procedure TMyThread.SetProgressCurrValue;
begin
  Form1.ProgressBar1.Position := FCurrValue;
  Form1.labResult.Caption := IntToStr(FResult);
end;

procedure TMyThread.SetProgressParams;
begin
  Form1.ProgressBar1.Max := MaxValue;
  Form1.ProgressBar1.Position := 0;
  Form1.labResult.Caption := '0';
end;

end.
