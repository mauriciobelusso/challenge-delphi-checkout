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
      Top = 175
      Width = 1252
      Height = 361
      Align = alClient
      DataSource = dsProdutos
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyUp = DBGrid1KeyUp
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'PRODUCT_ID'
          Title.Caption = 'C'#243'd. Produto'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPTION'
          Title.Caption = 'Produto'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTITY'
          Title.Caption = 'Quantidade'
          Width = 71
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'UNIT_VALUE'
          Title.Caption = 'Valor Unit'#225'rio'
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL'
          Title.Caption = 'Total'
          Width = 107
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 0
      Top = 586
      Width = 1252
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 4
      object btnFinalizarVenda: TButton
        Left = 1024
        Top = 0
        Width = 228
        Height = 41
        Align = alRight
        Caption = 'Gravar Pedido'
        TabOrder = 0
        OnClick = btnFinalizarVendaClick
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 536
      Width = 1252
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        1252
        50)
      object edtTotal: TLabeledEdit
        Left = 1120
        Top = 23
        Width = 121
        Height = 21
        Anchors = [akTop, akRight]
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Total'
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 134
      Width = 1252
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object btnAddProduto: TButton
        Left = 0
        Top = 0
        Width = 153
        Height = 41
        Align = alLeft
        Caption = 'Inserir'
        TabOrder = 0
        OnClick = btnAddProdutoClick
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 1252
      Height = 134
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lblCustomer: TLabel
        Left = 303
        Top = 27
        Width = 3
        Height = 13
      end
      object lblProduct: TLabel
        Left = 303
        Top = 70
        Width = 3
        Height = 13
      end
      object edtCustomer: TLabeledEdit
        Left = 97
        Top = 24
        Width = 200
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cliente'
        ReadOnly = True
        TabOrder = 1
      end
      object edtProduct: TLabeledEdit
        Left = 97
        Top = 67
        Width = 200
        Height = 21
        EditLabel.Width = 38
        EditLabel.Height = 13
        EditLabel.Caption = 'Produto'
        ReadOnly = True
        TabOrder = 3
      end
      object edtQuantity: TLabeledEdit
        Left = 16
        Top = 107
        Width = 121
        Height = 21
        Alignment = taRightJustify
        EditLabel.Width = 56
        EditLabel.Height = 13
        EditLabel.Caption = 'Quantidade'
        TabOrder = 4
        TextHint = '0'
        OnKeyPress = edtQuantityKeyPress
      end
      object edtCustomerId: TEdit
        Left = 16
        Top = 24
        Width = 75
        Height = 21
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 0
        TextHint = '0'
        OnExit = edtCustomerIdExit
      end
      object edtUnitValue: TLabeledEdit
        Left = 143
        Top = 107
        Width = 121
        Height = 21
        Alignment = taRightJustify
        EditLabel.Width = 64
        EditLabel.Height = 13
        EditLabel.Caption = 'Valor Unit'#225'rio'
        TabOrder = 5
        TextHint = '0'
        OnKeyPress = edtUnitValueKeyPress
      end
      object edtProductId: TEdit
        Left = 16
        Top = 67
        Width = 75
        Height = 21
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        TextHint = '0'
        OnExit = edtProductIdExit
      end
    end
  end
  object dsProdutos: TDataSource
    DataSet = FDMemTable1
    Left = 1056
    Top = 264
  end
  object FDMemTable1: TFDMemTable
    BeforePost = FDMemTable1BeforePost
    AfterPost = FDMemTable1AfterPost
    AfterDelete = FDMemTable1AfterDelete
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 984
    Top = 336
  end
end
