unit Ex2Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMyLongThread = class(TThread)
  private
    procedure DoUsefullTask; // ��������� ��� �������� �������� ������
  public
    procedure Execute; override;
  end;

  TForm1 = class(TForm)
    btnRunParallelThread: TButton;
    procedure btnRunParallelThreadClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    MyThread: TMyLongThread;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnRunParallelThreadClick(Sender: TObject);
begin
  // ��������� ������������ �����
  if MyThread = nil then
    MyThread := TMyLongThread.Create(False)
  else
    raise Exception.Create('�������������� ����� ��� �������!');
end;

{ TMyLongThread }

procedure TMyLongThread.DoUsefullTask;
begin
  // �������� ����� ����� ��������� ����� ������ �������� ������
  // � ������� ����� ������ ����� 5 ������ ��� �������� ��������, �������
  // ����� ���������� ��� ���������� �������� ������
  Sleep(5000);
end;

procedure TMyLongThread.Execute;
  procedure WaitTimeout(ATimeOut: Integer);
  begin
    Sleep(ATimeOut);
  end;
begin
  while not Terminated do
  begin
    DoUsefullTask;
    WaitTimeout(10000); // ������� ������� 10 ���.
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  // ��� �������� ��������� ���������� ��������� ������ ������
  // � ���������� ������ ������ MyThread
  if MyThread <> nil then
    MyThread.Free;
end;

end.
