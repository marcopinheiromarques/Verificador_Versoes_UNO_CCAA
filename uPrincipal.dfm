object frmVerificador: TfrmVerificador
  Left = 0
  Top = 0
  Caption = 'Verificador'
  ClientHeight = 611
  ClientWidth = 897
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 588
    Width = 897
    Height = 23
    Panels = <
      item
        Width = 300
      end
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 897
    Height = 93
    Align = alTop
    TabOrder = 1
    object btnAtualizar: TButton
      Left = 347
      Top = 11
      Width = 209
      Height = 73
      Caption = 'ATUALIZAR'
      TabOrder = 0
      OnClick = btnAtualizarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 93
    Width = 897
    Height = 495
    Align = alClient
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 895
      Height = 493
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'GERAL'
        object GroupBox1: TGroupBox
          Left = 8
          Top = 12
          Width = 872
          Height = 145
          Caption = 'TB_CCAA_UNO_VERSAO (UNO_0996)'
          TabOrder = 0
          object DBGrid1: TDBGrid
            Left = 16
            Top = 22
            Width = 625
            Height = 116
            DataSource = ds_TbCCAAUnoVersao
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
          end
          object DBMemo1: TDBMemo
            Left = 647
            Top = 22
            Width = 210
            Height = 116
            DataField = 'DESC_VERSAO'
            DataSource = ds_TbCCAAUnoVersao
            ReadOnly = True
            TabOrder = 1
          end
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 163
          Width = 872
          Height = 145
          Caption = 'TB_ADIAMENTO_VERSAO (UNO_0996)'
          TabOrder = 1
          object DBGrid2: TDBGrid
            Left = 16
            Top = 21
            Width = 841
            Height = 116
            DataSource = ds_Tb_Adiamento_Versao
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
          end
        end
        object GroupBox3: TGroupBox
          Left = 8
          Top = 314
          Width = 872
          Height = 145
          Caption = 'TB_CONTROLE_VERSAO (UNO_0996)'
          TabOrder = 2
          object DBGrid3: TDBGrid
            Left = 16
            Top = 21
            Width = 841
            Height = 116
            DataSource = ds_TbControleVersao
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'FRANQUIAS'
        ImageIndex = 1
        object GroupBox4: TGroupBox
          Left = 3
          Top = 16
          Width = 881
          Height = 153
          Caption = 'VERS'#213'ES'
          TabOrder = 0
          object ListView: TListView
            Left = 16
            Top = 21
            Width = 329
            Height = 116
            Checkboxes = True
            Columns = <>
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsList
            OnItemChecked = ListViewItemChecked
          end
          object GroupBox6: TGroupBox
            Left = 363
            Top = 16
            Width = 502
            Height = 121
            Caption = 'QUANTITATIVOS'
            TabOrder = 1
            object mmoQuantitativos: TMemo
              Left = 11
              Top = 24
              Width = 478
              Height = 81
              Lines.Strings = (
                '')
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object GroupBox5: TGroupBox
          Left = 3
          Top = 175
          Width = 881
          Height = 274
          Caption = 'FRANQUIAS POR VERS'#195'O'
          TabOrder = 1
          object DBGrid4: TDBGrid
            Left = 16
            Top = 24
            Width = 849
            Height = 233
            DataSource = dsFranquiasPorVersao
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
          end
        end
      end
    end
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL'
      'Database=UNO_9996'
      'User_Name=_datanet'
      'Password=use@external'
      'Server=appsrv03')
    LoginPrompt = False
    Left = 400
    Top = 248
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 528
    Top = 248
  end
  object qryTbCCAAUnoVersao: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from TB_CCAA_UNO_VERSAO order by cod_versao desc')
    Left = 400
    Top = 304
  end
  object ds_TbCCAAUnoVersao: TDataSource
    DataSet = qryTbCCAAUnoVersao
    Left = 528
    Top = 304
  end
  object qyTbAdiamentoVersao: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from tb_adiamento_versao order by dta_adiamento desc')
    Left = 400
    Top = 360
  end
  object ds_Tb_Adiamento_Versao: TDataSource
    DataSet = qyTbAdiamentoVersao
    Left = 528
    Top = 360
  end
  object qyTbControleVersao: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'select * from tb_controle_versao order by Dta_aplicacao_versao d' +
        'esc')
    Left = 400
    Top = 416
  end
  object ds_TbControleVersao: TDataSource
    DataSet = qyTbControleVersao
    Left = 528
    Top = 416
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 400
    Top = 472
  end
  object dsFranquiasPorVersao: TDataSource
    DataSet = ClientDataSet
    Left = 784
    Top = 397
  end
  object ClientDataSet: TClientDataSet
    PersistDataPacket.Data = {
      550000009619E0BD01000000180000000200000000000300000055000749445F
      484F53540100490000000100055749445448020002000A000A4E554D5F564552
      53414F01004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 784
    Top = 341
    object ClientDataSetID_HOST: TStringField
      FieldName = 'ID_HOST'
      Size = 10
    end
    object ClientDataSetNUM_VERSAO: TStringField
      FieldName = 'NUM_VERSAO'
    end
  end
end
