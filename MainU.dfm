object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 364
  ClientWidth = 869
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 59
    Height = 13
    Caption = 'Resource ID'
  end
  object BtnCallAPI: TButton
    Left = 344
    Top = 19
    Width = 75
    Height = 25
    Caption = 'API'
    TabOrder = 0
    OnClick = BtnCallAPIClick
  end
  object TxtID: TEdit
    Left = 105
    Top = 21
    Width = 233
    Height = 21
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 55
    Width = 835
    Height = 288
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = '_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'No'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'announce_date'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Notified_date'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sex'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'age'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unit'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nationality'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'province_of_isolation'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'risk'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'province_of_onset'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'district_of_onset'
        Width = 100
        Visible = True
      end>
  end
  object NetHTTPClient1: TNetHTTPClient
    Asynchronous = False
    ConnectionTimeout = 60000
    ResponseTimeout = 60000
    HandleRedirects = True
    AllowCookies = True
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 400
    Top = 96
  end
  object NetHTTPRequest1: TNetHTTPRequest
    Asynchronous = False
    ConnectionTimeout = 60000
    ResponseTimeout = 60000
    Client = NetHTTPClient1
    Left = 400
    Top = 152
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 448
    Top = 208
    object ClientDataSet1_id: TIntegerField
      FieldName = '_id'
    end
    object ClientDataSet1No: TIntegerField
      FieldName = 'No'
    end
    object ClientDataSet1announce_date: TSQLTimeStampField
      FieldName = 'announce_date'
    end
    object ClientDataSet1Notified_date: TSQLTimeStampField
      FieldName = 'Notified_date'
    end
    object ClientDataSet1sex: TStringField
      FieldName = 'sex'
    end
    object ClientDataSet1age: TIntegerField
      FieldName = 'age'
    end
    object ClientDataSet1Unit: TStringField
      FieldName = 'Unit'
    end
    object ClientDataSet1nationality: TStringField
      FieldName = 'nationality'
      Size = 50
    end
    object ClientDataSet1province_of_isolation: TStringField
      FieldName = 'province_of_isolation'
      Size = 100
    end
    object ClientDataSet1risk: TStringField
      FieldName = 'risk'
      Size = 255
    end
    object ClientDataSet1province_of_onset: TStringField
      FieldName = 'province_of_onset'
      Size = 100
    end
    object ClientDataSet1district_of_onset: TStringField
      FieldName = 'district_of_onset'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 376
    Top = 216
  end
end
