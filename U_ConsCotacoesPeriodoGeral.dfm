inherited _frmConsCotacoesPeriodoGeral: T_frmConsCotacoesPeriodoGeral
  Left = 264
  Top = 37
  Caption = 'Consulta todas as cota'#231#245'es por per'#237'odo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pangrid_atendimentos: TPanel
    inherited grid_ListaCotacoes: TDBGrid
      Hint = ''
      OnCellClick = nil
    end
  end
  inherited pan_titulo: TPanel
    Caption = 'Consulta todas as cota'#231#245'es do per'#237'odo selecionado'
  end
end
