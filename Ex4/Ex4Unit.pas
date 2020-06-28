unit Ex4Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ProgressViewer;

type
  TMyLongThread = class(TThread)
  private
    FTaskNum: Integer;
    procedure DoUsefullTask1; // ������ ������
    procedure DoUsefullTask2; // ������ ������
    procedure DoFinalizeTask; // ������ ����������� ��� ���������� ������ ������
  public
    constructor Create(TaskNum: Integer);
    procedure Execute; override;
  end;

  TForm1 = class(TForm)
    btnRunParallelThreads: TButton;
    Label1: TLabel;
    cbTerminateMode: TComboBox;
    procedure btnRunParallelThreadsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    MyThread1: TMyLongThread; // ����� ��� ������ ������
    MyThread2: TMyLongThread; // ����� ��� ������ ������
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnRunParallelThreadsClick(Sender: TObject);
begin
  // ��������� ������������ ����� ��� ������ 1
  if MyThread1 = nil then
    MyThread1 := TMyLongThread.Create(1);

  // ��������� ������������ ����� ��� ������ 2
  if MyThread2 = nil then
    MyThread2 := TMyLongThread.Create(2);
end;

{ TMyLongThread }

constructor TMyLongThread.Create(TaskNum: Integer);
begin
  inherited Create(False); // �������� ������������ �����������

  // ���������� �������� TaskNum. �� ����� � ������ Execute
  FTaskNum := TaskNum;
end;

procedure TMyLongThread.DoFinalizeTask;
begin
  Sleep(5000); // ������ �������� ������ �������� 5 ������
end;

procedure TMyLongThread.DoUsefullTask1;
begin
  Sleep(1000); // ������ �������� ������ �������� 1 �������
end;

procedure TMyLongThread.DoUsefullTask2;
begin
  Sleep(2000); // ������ �������� ������ �������� 2 �������
end;

procedure TMyLongThread.Execute;
  procedure WaitTimeout(ATimeOut: Integer);
  begin
    Sleep(ATimeOut);
  end;
begin
  while True do
  begin
    if Terminated then
    begin
      DoFinalizeTask; // ��������� �������� ��� ���������� ������
      Exit; // ��������� ������ ������
    end else
    begin
      if FTaskNum = 1 then
        DoUsefullTask1  // ��������� ������ 1
      else
        DoUsefullTask2; // ��������� ������ 2

      if not Terminated then // �������������� �������� �� ��������!
        WaitTimeout(1000); // ������� ������� 1 ���
    end;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  AProgress: TProgressViewer;
begin
  AProgress := TProgressViewer.Create('����� �� ���������');
  try
    if cbTerminateMode.ItemIndex = 1 then
    begin // ������ ����� "������������ (�������)"
      if Assigned(MyThread1) then
        MyThread1.Terminate; // ���������� ���� Terminated
      if Assigned(MyThread2) then
        MyThread2.Terminate; // ���������� ���� Terminated
    end;
    MyThread1.Free;
    MyThread2.Free;
  finally
    AProgress.TerminateProgress;
  end;  
end;

end.
