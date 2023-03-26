object Form1: TForm1
  Left = 260
  Top = 9
  Width = 882
  Height = 718
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 24
    Top = 72
    Width = 105
    Height = 105
    OnMouseDown = Image1MouseDown
  end
  object SpeedButton1: TSpeedButton
    Left = 216
    Top = 24
    Width = 23
    Height = 22
    GroupIndex = 1
    Enabled = False
  end
  object Label1: TLabel
    Left = 88
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Width'
  end
  object Label2: TLabel
    Left = 152
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Height'
  end
  object Label3: TLabel
    Left = 368
    Top = 8
    Width = 68
    Height = 13
    Caption = 'Every ... frame'
  end
  object Label4: TLabel
    Left = 248
    Top = 8
    Width = 22
    Height = 13
    Caption = 'Start'
  end
  object Label5: TLabel
    Left = 304
    Top = 8
    Width = 19
    Height = 13
    Caption = 'End'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Button2'
    Enabled = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object UpDown1: TUpDown
    Left = 129
    Top = 24
    Width = 17
    Height = 21
    Associate = Edit1
    Min = 1
    Position = 20
    TabOrder = 2
    Wrap = True
    OnChanging = UpDown1Changing
  end
  object TrackBar1: TTrackBar
    Left = 8
    Top = 64
    Width = 12
    Height = 129
    Enabled = False
    Orientation = trVertical
    TabOrder = 3
    ThumbLength = 10
  end
  object UpDown2: TUpDown
    Left = 193
    Top = 24
    Width = 17
    Height = 21
    Associate = Edit2
    Min = 2
    Position = 2
    TabOrder = 4
    Wrap = True
    OnChanging = UpDown1Changing
  end
  object UpDown3: TUpDown
    Left = 409
    Top = 24
    Width = 17
    Height = 21
    Associate = Edit3
    Min = 1
    Position = 1
    TabOrder = 5
    Wrap = True
  end
  object Edit1: TEdit
    Left = 88
    Top = 24
    Width = 41
    Height = 21
    TabOrder = 6
    Text = '20'
  end
  object Edit2: TEdit
    Left = 152
    Top = 24
    Width = 41
    Height = 21
    TabOrder = 7
    Text = '2'
  end
  object Edit3: TEdit
    Left = 368
    Top = 24
    Width = 41
    Height = 21
    TabOrder = 8
    Text = '1'
  end
  object Edit4: TEdit
    Left = 248
    Top = 24
    Width = 49
    Height = 21
    TabOrder = 9
    Text = '1'
  end
  object Edit5: TEdit
    Left = 304
    Top = 24
    Width = 49
    Height = 21
    TabOrder = 10
  end
  object RadioGroup1: TRadioGroup
    Left = 448
    Top = 8
    Width = 65
    Height = 49
    Caption = 'Extention'
    ItemIndex = 0
    Items.Strings = (
      'JPG'
      'BMP')
    TabOrder = 11
  end
  object OpenDialog1: TOpenDialog
    Left = 144
    Top = 56
  end
end
