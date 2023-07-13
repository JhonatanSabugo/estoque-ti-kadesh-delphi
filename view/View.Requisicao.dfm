object FrmRequisicao: TFrmRequisicao
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  AutoSize = True
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Requisi'#231#227'o'
  ClientHeight = 142
  ClientWidth = 241
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  PixelsPerInch = 96
  TextHeight = 13
  object Observação: TLabel
    Left = 1
    Top = 0
    Width = 113
    Height = 20
    Caption = 'Observa'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 1
    Top = 121
    Width = 200
    Height = 21
    Caption = 'Nuemro de itens p/ requisi'#231#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtObs: TMemo
    Left = 0
    Top = 26
    Width = 241
    Height = 89
    TabOrder = 0
  end
  object EdtItens: TEdit
    Left = 207
    Top = 121
    Width = 34
    Height = 21
    TabOrder = 1
  end
end
