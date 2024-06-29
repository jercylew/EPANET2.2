object ParamTuningForm: TParamTuningForm
  Left = 102
  Top = 0
  Hint = 'Parameters tunning for nodes and links'
  BorderStyle = bsDialog
  Caption = 'Parameters Tuning'
  ClientHeight = 408
  ClientWidth = 645
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
  object Label1: TLabel
    Left = 40
    Top = 59
    Width = 77
    Height = 13
    Caption = 'Parameter Type'
  end
  object Label2: TLabel
    Left = 384
    Top = 59
    Width = 32
    Height = 13
    Caption = 'Object'
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 24
    Width = 577
    Height = 89
    Caption = 'Choose an object'
    TabOrder = 2
  end
  object cmbParmType: TComboBox
    Left = 131
    Top = 56
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemIndex = 6
    TabOrder = 0
    Text = 'All'
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
  object cmbObject: TComboBox
    Left = 440
    Top = 56
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 1
    OnChange = cmbObjectChange
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 143
    Width = 577
    Height = 257
    Caption = 'Parameters Tunning'
    TabOrder = 3
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
  object GridPanel1: TGridPanel
    Left = 632
    Top = 408
    Width = 185
    Height = 41
    Caption = 'GridPanel1'
    ColumnCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    ControlCollection = <>
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    TabOrder = 4
  end
end
