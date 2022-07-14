unit U_ConsMetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, DBCtrls,SqlExpr,
  ToolEdit, DateUtils;

type
  T_frmConsMetas = class(TForm)
    pan_titulo: TPanel;
    pangrid_atendimentos: TPanel;
    pan_botoes: TPanel;
    lblDataDoDia: TLabel;
    lblHoraAtual: TLabel;
    lblStatusLogoff: TLabel;
    lbl45: TLabel;
    gridMetas: TDBGrid;
    GroupBox1: TGroupBox;
    btnFechar: TSpeedButton;
    grPeriodo: TGroupBox;
    lbl52: TLabel;
    edt_DataInicio: TDateEdit;
    lbl53: TLabel;
    edt_DataFim: TDateEdit;
    grMes: TGroupBox;
    cmbMeses: TComboBox;
    cmbAnos: TComboBox;
    GroupBox2: TGroupBox;
    btnPesquisar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure PesquisarPeriodoMetas;
    procedure PreencheComboAnos;
    procedure PesquisarMetasPeloMesSelecionado;
    procedure cmbAnosClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure Pesquisar;
    procedure edt_DataFimButtonClick(Sender: TObject);
    procedure cmbMesesClick(Sender: TObject);
    procedure edt_DataInicioChange(Sender: TObject);
    procedure gridMetasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);


  private
    { Private declarations }
    mes_ano : string;
  public
    { Public declarations }

  end;

var
  _frmConsMetas: T_frmConsMetas;


implementation

uses U_dmDados, U_BiblioSysSalao, U_QRelMetasMes, U_QRelMetasPeriodo;

{$R *.dfm}


procedure T_frmConsMetas.FormCreate(Sender: TObject);
//DESABILITA O BOTAO FECHAR DO FORMULÁRIO
var
  hwndHandle : THANDLE;
  hMenuHandle : HMenu;
begin
//Impede movimentação do formulário
 DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);

  hwndHandle := Self.Handle;
  if (hwndHandle <> 0) then
    begin
      hMenuHandle := GetSystemMenu(hwndHandle, FALSE);
        if (hMenuHandle <> 0) then
          DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);

  end;

    //Recebe a data atual por padrão

    lblDataDoDia.Caption    :=  DateToStr(date);
    lblHoraAtual.Caption    :=  timetoStr(time);
    lblStatusLogoff.Caption :=  IdentificarUsuarioLogado;
    PreencheComboAnos;
   
end;

procedure T_frmConsMetas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    Release;

end;

procedure T_frmConsMetas.btnFecharClick(Sender: TObject);
begin

    Close;

end;     

procedure T_frmConsMetas.PesquisarPeriodoMetas;
begin

             DataInicio     := edt_DataInicio.date;
             DataFim        := edt_DataFim.date;

             with Q_RelMetasPeriodo.cds_RelMetasPeriodo do
             begin

                Close;
                Params.ParamByName('datainicio').AsDate  := DataInicio;
                Params.ParamByName('datafim').AsDate     := DataFim;
                Open;

                if not IsEmpty then
                 begin

                     Q_RelMetasPeriodo.cds_RelMetasPeriodo.Active:= True;
                     Q_RelMetasPeriodo.Preview;

                     edt_DataInicio.Clear;
                     edt_DataFim.Clear;
                     edt_DataFim.Tag := 0;
                     grMes.Enabled   := true;

                end else begin        

                     Application.MessageBox('Não foram encontrados registros no período selecionado!',
                         'Atenção...', MB_OK + MB_ICONWARNING);
                     exit;

                end;

          end;
end;


procedure T_frmConsMetas.PesquisarMetasPeloMesSelecionado;
begin

      mes_ano   :=  cmbMeses.Text + '/' + cmbAnos.Text;

      with Q_RelMetasMes.cds_RelMetasMes do
       begin

          Close;
          Params.ParamByName('pmesano').AsString  := mes_ano;
          Open;

          if IsEmpty then
           begin

                   Application.MessageBox('Não foram encontrados registros no período selecionado!',
                   'Atenção...', MB_OK + MB_ICONWARNING);
                   grPeriodo.Enabled := true;
                   exit;

          end else begin

               Q_RelMetasMes.cds_RelMetasMes.Active:= True;
               Q_RelMetasMes.Preview;
               grPeriodo.Enabled := false;

          end;

    end;

end;

procedure T_frmConsMetas.cmbAnosClick(Sender: TObject);
begin

      grPeriodo.Enabled := false;

end;

procedure T_frmConsMetas.btnPesquisarClick(Sender: TObject);
begin

     Pesquisar;

end;

procedure T_frmConsMetas.Pesquisar;
begin

       if ( edt_DataFim.Tag = 0 ) then
       begin

             PesquisarMetasPeloMesSelecionado;

       end else begin

            if (edt_DataInicio.Text = '  /  /    ') or (edt_DataFim.Text = '  /  /    ') then
              begin
                        Application.MessageBox('É necessário uma data inicial e uma data final para efetuar a pesquisa !', 'Período Inválido!', MB_OK);
                        edt_datainicio.text          := '  /  /    ';
                        edt_DataInicio.SetFocus;

              end
              else if (edt_DataFim.Date >= edt_DataInicio.Date) then begin

                        PesquisarPeriodoMetas;

             end else begin

                Application.MessageBox('A data inicial não pode ser maior que a data final!', 'Período Inválido!', MB_OK);
                edt_DataInicio.SetFocus;

            end;

      end;
      
      //COLOCAR NO FINAL DAS OPÇÕES
       edt_datainicio.text   := '  /  /    ';
       grPeriodo.Enabled     := true;
       grMes.Enabled         := true;
       gridMetas.DataSource  := dm_Conexao.ds_Metas;

end;

procedure T_frmConsMetas.edt_DataFimButtonClick(Sender: TObject);
begin

      grMes.Enabled   := false;
      edt_DataFim.Tag := 100;

end;

procedure T_frmConsMetas.PreencheComboAnos;
var
  i : integer;
  AnoAtual : string;
begin

     //populando a comboano com os anos
     for i := 2000 to 3000 do
     begin

          cmbAnos.Items.Add(inttostr(i));

     end;

     //setando o ano vigente na comboano
     DataDoDia    := date;
     AnoAtual     := IntToStr(YearOf(DataDoDia));

     cmbAnos.ItemIndex := Integer(cmbAnos.Items.IndexOf(AnoAtual));

end;


procedure T_frmConsMetas.cmbMesesClick(Sender: TObject);
begin

    grPeriodo.Enabled := false;

end;

procedure T_frmConsMetas.edt_DataInicioChange(Sender: TObject);
begin

  grMes.Enabled := false;
  
end;

procedure T_frmConsMetas.gridMetasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

     with gridmetas do
      begin
        if DataSource.DataSet.FieldByName('resultado').AsString = 'PARABENS META ALCANCADA' then
        begin

              //caso o status seja 'ENTREGUE' as letras estarão na cor AZUL
              Canvas.Font.Style  := [fsBold];
              Canvas.Font.Color  := clBlue;
         end else begin

             //caso o status seja 'PENDENTE' as letras estarão na cor VERMELHA
             Canvas.Font.Style  := [fsBold];
             Canvas.Font.Color  := clRed;

         end;

         //dando cor á linha selecionada
         if gdSelected in State then
         begin

              if DataSource.DataSet.FieldByName('resultado').AsString = 'META NAO ALCANCADA' then
              begin

                    Canvas.Brush.Color := clSkyBlue;   //cor de fundo da linha
                    Canvas.Font.Color  := clred;     //cor da letra
              end else begin

                    Canvas.Brush.Color := clSkyBlue;   //cor de fundo da linha
                    Canvas.Font.Color  := clblack;     //cor da letra

              end;
         end;

         Canvas.FillRect(Rect);
         DefaultDrawColumnCell(Rect,DataCol,Column,State);        
     end;        

end;

end.

