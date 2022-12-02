object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Checkout'
  ClientHeight = 627
  ClientWidth = 1252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1252
    Height = 627
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 0
      Top = 136
      Width = 1252
      Height = 409
      Align = alBottom
      DataSource = dsProdutos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Panel1: TPanel
      Left = 0
      Top = 586
      Width = 1252
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object btnFinalizarVenda: TButton
        Left = 1024
        Top = 0
        Width = 228
        Height = 41
        Align = alRight
        Caption = 'Finalizar Venda'
        TabOrder = 0
        OnClick = btnFinalizarVendaClick
      end
      object btnCancelar: TButton
        Left = 0
        Top = 0
        Width = 228
        Height = 41
        Align = alLeft
        Caption = 'Cancelar'
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 545
      Width = 1252
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
    end
    object LabeledEdit1: TLabeledEdit
      Left = 16
      Top = 24
      Width = 200
      Height = 21
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'LabeledEdit1'
      TabOrder = 3
    end
    object LabeledEdit2: TLabeledEdit
      Left = 16
      Top = 67
      Width = 200
      Height = 21
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'LabeledEdit1'
      TabOrder = 4
    end
    object LabeledEdit3: TLabeledEdit
      Left = 222
      Top = 67
      Width = 121
      Height = 21
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'LabeledEdit1'
      TabOrder = 5
    end
    object LabeledEdit4: TLabeledEdit
      Left = 349
      Top = 67
      Width = 121
      Height = 21
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'LabeledEdit1'
      TabOrder = 6
    end
    object Panel3: TPanel
      Left = 0
      Top = 95
      Width = 1252
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 7
      object btnAddProduto: TButton
        Left = 0
        Top = 0
        Width = 228
        Height = 41
        Align = alLeft
        Caption = 'Inserir'
        TabOrder = 0
      end
    end
  end
  object dsProdutos: TDataSource
    DataSet = FDMemTable1
    Left = 1056
    Top = 264
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 984
    Top = 336
  end
end
