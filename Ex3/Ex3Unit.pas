unit Ex3Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ProgressViewer;

type
  TMyShortThread = class(TThread)
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
    MyThread: TMyShortThread;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnRunParallelThreadClick(Sender: TObject);
begin
  // ��������� ������������ �����. ���� ������ ������ ��� ������,
  // �� ���������� ���.
  if MyThread <> nil then
    FreeAndNil(MyThread);
  MyThread := TMyShortThread.Create(False);
end;

{ TMyShortThread }

procedure TMyShortThread.DoUsefullTask;
var
 AProgress: TProgressViewer;
begin
  // �������� ����� ����� ��������� ����� ������ �������� ������
  // � ������� ����� ������ ����� 5 ������ ��� �������� ��������, �������
  // ����� ���������� ��� ���������� �������� ������
  AProgress := TProgressViewer.Create('����������� ����� TMyShortThread');
  Sleep(5000);
  AProgress.TerminateProgress;
end;

procedure TMyShortThread.Execute;
begin
  DoUsefullTask;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  // ��� �������� ��������� ���������� ��������� ������ ������
  // � ���������� ������ ������ MyThread
  if MyThread <> nil then
    MyThread.Free;
end;

end.
