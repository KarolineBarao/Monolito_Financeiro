object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Monolito Financeiro'
  ClientHeight = 423
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 40
    Top = 104
    object mnuCadastro: TMenuItem
      Caption = 'Cadastro'
      object mnuUsuarios: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = mnuUsuariosClick
      end
    end
    object mnuRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object mnuAjuda: TMenuItem
      Caption = 'Ajuda'
    end
  end
end
