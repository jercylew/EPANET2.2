object ParamTuningForm: TParamTuningForm
  Left = 102
  Top = 0
  Hint = 'Parameters tunning for nodes and links'
  BorderStyle = bsDialog
  Caption = 'Parameters Tuning'
  ClientHeight = 530
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 24
    Top = 255
    Width = 577
    Height = 257
    Caption = 'Parameters Tunning'
    TabOrder = 0
    object lblParam1: TLabel
      Left = 16
      Top = 36
      Width = 56
      Height = 13
      Caption = 'Parameter1'
    end
    object Label4: TLabel
      Left = 340
      Top = 40
      Width = 22
      Height = 13
      Caption = 'Step'
    end
    object lblParam2: TLabel
      Left = 16
      Top = 65
      Width = 56
      Height = 13
      Caption = 'Parameter2'
    end
    object lblParam3: TLabel
      Left = 16
      Top = 93
      Width = 56
      Height = 13
      Caption = 'Parameter3'
    end
    object lblParam4: TLabel
      Left = 16
      Top = 120
      Width = 56
      Height = 13
      Caption = 'Parameter4'
    end
    object lblParam5: TLabel
      Left = 16
      Top = 148
      Width = 56
      Height = 13
      Caption = 'Parameter5'
    end
    object lblParam6: TLabel
      Left = 16
      Top = 175
      Width = 56
      Height = 13
      Caption = 'Parameter6'
    end
    object Label10: TLabel
      Left = 340
      Top = 65
      Width = 22
      Height = 13
      Caption = 'Step'
    end
    object Label11: TLabel
      Left = 340
      Top = 93
      Width = 22
      Height = 13
      Caption = 'Step'
    end
    object Label12: TLabel
      Left = 340
      Top = 120
      Width = 22
      Height = 13
      Caption = 'Step'
    end
    object Label13: TLabel
      Left = 340
      Top = 152
      Width = 22
      Height = 13
      Caption = 'Step'
    end
    object Label14: TLabel
      Left = 340
      Top = 171
      Width = 22
      Height = 13
      Caption = 'Step'
    end
    object scrlbVal1: TScrollBar
      Left = 140
      Top = 36
      Width = 190
      Height = 21
      Max = 1000
      PageSize = 0
      TabOrder = 0
      OnChange = scrlbVal1Change
    end
    object edtVal1: TEdit
      Left = 448
      Top = 37
      Width = 85
      Height = 21
      TabOrder = 1
      Text = '0'
      OnChange = edtVal1Change
    end
    object edtStep1: TEdit
      Left = 368
      Top = 37
      Width = 35
      Height = 21
      TabOrder = 2
      Text = '1'
    end
    object scrlbVal2: TScrollBar
      Left = 140
      Top = 63
      Width = 190
      Height = 21
      Max = 1000
      PageSize = 0
      TabOrder = 3
      OnChange = scrlbVal2Change
    end
    object scrlbVal3: TScrollBar
      Left = 140
      Top = 90
      Width = 190
      Height = 21
      Max = 1000
      PageSize = 0
      TabOrder = 4
      OnChange = scrlbVal3Change
    end
    object scrlbVal4: TScrollBar
      Left = 140
      Top = 117
      Width = 190
      Height = 21
      Max = 1000
      PageSize = 0
      TabOrder = 5
      OnChange = scrlbVal4Change
    end
    object scrlbVal5: TScrollBar
      Left = 140
      Top = 144
      Width = 190
      Height = 21
      Max = 1000
      PageSize = 0
      TabOrder = 6
      OnChange = scrlbVal5Change
    end
    object scrlbVal6: TScrollBar
      Left = 140
      Top = 171
      Width = 190
      Height = 21
      Max = 1000
      PageSize = 0
      TabOrder = 7
      OnChange = scrlbVal6Change
    end
    object edtStep2: TEdit
      Left = 368
      Top = 64
      Width = 35
      Height = 21
      TabOrder = 8
      Text = '1'
    end
    object edtStep3: TEdit
      Left = 368
      Top = 91
      Width = 35
      Height = 21
      TabOrder = 9
      Text = '1'
    end
    object edtStep4: TEdit
      Left = 368
      Top = 118
      Width = 35
      Height = 21
      TabOrder = 10
      Text = '1'
    end
    object edtStep5: TEdit
      Left = 368
      Top = 145
      Width = 35
      Height = 21
      TabOrder = 11
      Text = '1'
    end
    object edtStep6: TEdit
      Left = 368
      Top = 172
      Width = 35
      Height = 21
      TabOrder = 12
      Text = '1'
    end
    object edtVal2: TEdit
      Left = 448
      Top = 64
      Width = 85
      Height = 21
      TabOrder = 13
      Text = '0'
      OnChange = edtVal2Change
    end
    object edtVal3: TEdit
      Left = 448
      Top = 91
      Width = 85
      Height = 21
      TabOrder = 14
      Text = '0'
      OnChange = edtVal3Change
    end
    object edtVal4: TEdit
      Left = 448
      Top = 120
      Width = 85
      Height = 21
      TabOrder = 15
      Text = '0'
      OnChange = edtVal4Change
    end
    object edtVal5: TEdit
      Left = 448
      Top = 147
      Width = 85
      Height = 21
      TabOrder = 16
      Text = '0'
      OnChange = edtVal5Change
    end
    object edtVal6: TEdit
      Left = 448
      Top = 174
      Width = 85
      Height = 21
      TabOrder = 17
      Text = '0'
      OnChange = edtVal6Change
    end
  end
  object TabObjectGroup: TPageControl
    Left = 24
    Top = 16
    Width = 577
    Height = 233
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Choose an Object'
      object Label1: TLabel
        Left = 12
        Top = 106
        Width = 77
        Height = 13
        Caption = 'Parameter Type'
      end
      object Label2: TLabel
        Left = 354
        Top = 106
        Width = 32
        Height = 13
        Caption = 'Object'
      end
      object cmbObject: TComboBox
        Left = 392
        Top = 103
        Width = 145
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 0
        OnChange = cmbObjectChange
      end
      object cmbParmType: TComboBox
        Left = 95
        Top = 103
        Width = 145
        Height = 22
        Style = csOwnerDrawFixed
        ItemIndex = 0
        TabOrder = 1
        Text = 'Junction'
        OnChange = cmbParmTypeChange
        Items.Strings = (
          'Junction'
          'Reservoir'
          'Tank'
          'Pipe'
          'Pump'
          'Valve'
          'All')
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Choose an Group'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 28
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 16
        Top = 10
        Width = 24
        Height = 13
        Caption = 'Type'
      end
      object Label5: TLabel
        Left = 320
        Top = 10
        Width = 50
        Height = 13
        Caption = 'Group Tag'
      end
      object cmbGroup: TComboBox
        Left = 376
        Top = 7
        Width = 145
        Height = 21
        TabOrder = 0
        OnChange = cmbGroupChange
      end
      object cmbGroupType: TComboBox
        Left = 46
        Top = 7
        Width = 145
        Height = 21
        ItemIndex = 0
        TabOrder = 1
        Text = 'Junction'
        OnChange = cmbGroupTypeChange
        Items.Strings = (
          'Junction'
          'Reservoir'
          'Tank'
          'Pipe'
          'Pump'
          'Valve')
      end
      object listTagObjects: TVirtualListBox
        Left = 136
        Top = 48
        Width = 263
        Height = 113
        Count = 0
        HorizScroll = False
        ItemHeight = 16
        ItemIndex = -1
        OnGetItem = ItemListBoxGetItem
        TabOrder = 2
      end
    end
  end
end
