object DemoLoggerForm: TDemoLoggerForm
  Left = 0
  Top = 0
  Caption = #1044#1077#1084#1086#1085#1089#1090#1088#1072#1094#1080#1103' '#1079#1072#1087#1080#1089#1080' '#1074' '#1083#1086#1075' '#1095#1077#1088#1077#1079' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1086#1090#1086#1082
  ClientHeight = 288
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 132
    Height = 16
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1081':'
  end
  object Label2: TLabel
    Left = 24
    Top = 96
    Width = 457
    Height = 32
    Caption = 
      #1054#1089#1090#1086#1088#1086#1078#1085#1086'! '#1045#1089#1083#1080' '#1042#1099' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1077' SSD, '#1090#1086' '#1087#1086#1089#1090#1088#1086#1095#1085#1072#1103' '#1079#1072#1087#1080#1089#1100' 10 '#1090#1099#1089'.' +
      ' '#1089#1090#1088#1086#1082' '#1074#13#10#1083#1086#1075'-'#1092#1072#1081#1083' '#1084#1086#1078#1077#1090' '#1079#1072#1085#1103#1090#1100' '#1086#1082#1086#1083#1086' '#1084#1080#1085#1091#1090#1099', '#1074' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1080' '#1086#1090' '#1084 +
      #1086#1076#1077#1083#1080' SSD.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 226
    Width = 486
    Height = 32
    Caption = 
      #1055#1088#1080' '#1079#1072#1087#1080#1089#1080' '#1074' '#1083#1086#1075' '#1095#1077#1088#1077#1079' '#1076#1086#1087'. '#1087#1086#1090#1086#1082' '#1073#1091#1076#1077#1090' '#1084#1086#1084#1077#1085#1090#1072#1083#1100#1085#1086' '#1079#1072#1087#1080#1089#1099#1074#1072#1090#1100#1089#1103 +
      ' '#1087#1088#1072#1082#1090#1080#1095#1077#1089#1082#1080#13#10#1083#1102#1073#1086#1081' '#1086#1073#1098#1105#1084' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080', '#1076#1072#1078#1077' 1 '#1084#1083#1085' '#1089#1090#1088#1086#1082'!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 16
    Top = 67
    Width = 425
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1103' '#1074' '#1083#1086#1075'-'#1092#1072#1081#1083' '#1073#1077#1079' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1087#1086#1090#1086#1082#1072
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 154
    Top = 21
    Width = 87
    Height = 24
    TabOrder = 1
    Text = '10000'
  end
  object Button2: TButton
    Left = 16
    Top = 195
    Width = 425
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1103' '#1074' '#1083#1086#1075'-'#1092#1072#1081#1083' '#1095#1077#1088#1077#1079' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1086#1090#1086#1082
    TabOrder = 2
    OnClick = Button2Click
  end
  object cbCloseApp: TCheckBox
    Left = 456
    Top = 200
    Width = 145
    Height = 17
    Caption = #1047#1072#1082#1088#1099#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
    TabOrder = 3
  end
end
