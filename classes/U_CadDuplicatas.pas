unit U_CadDuplicatas;

interface
uses Controls, SysUtils, Dialogs, u_dmDados, u_biblioSysSalao;
  type TDuplicata = class
  private
      Fid_duplicata  : integer;
      Fpedido_id     : integer;
      Fnum_duplicata : string;
      Fvalor         : double;
      Fdtvencimento  : Tdate;
      Fdtpagamento   : Tdate;
      Fdatacad       : Tdate;
      Fmesano        : string;
      Fstatus        : string;

  public
     constructor criarObj;
     destructor Destroy; override;
     property id_duplicata  : integer read Fid_duplicata  write Fid_duplicata;
     property pedido_id     : integer read Fpedido_id     write Fpedido_id;
     property num_duplicata : string  read Fnum_duplicata write Fnum_duplicata;
     property valor         : double  read Fvalor         write Fvalor;
     property dtvencimento  : Tdate   read Fdtvencimento  write Fdtvencimento;
     property dtpagamento   : Tdate   read Fdtpagamento   write Fdtpagamento;
     property datacad       : Tdate   read Fdatacad       write Fdatacad;
     property mesano        : string  read Fmesano        write Fmesano;
     property status        : string  read Fstatus        write Fstatus;

     Function inserir   : boolean;
     Function atualizar : Boolean;
     Function excluir   (pCodigo: integer): Boolean;
     Function pesquisar (pCodigo: integer): Boolean;  

  end;

implementation

uses U_dmPesquisas, SqlExpr;

{ TDuplicata }

constructor TDuplicata.criarObj;
begin
id_duplicata:=0;
pedido_id:=0;
num_duplicata:='';
valor:=0;
dtvencimento:=0;
dtpagamento:=0;
datacad:=0;
mesano:='';
status:='';
end;

destructor TDuplicata.Destroy;
begin
  inherited;
end;

function TDuplicata.inserir:boolean;
begin
   _Sql := 'INSERT INTO duplicatas (id_duplicata, pedido_id, num_duplicata, valor, dtvencimento, datacad, mesano, status) '+
           'VALUES (:pIDDuplicata, :pIDPedido, :pNumDuplicata, :pValor, :pVencto, :pDataCad, :pMesano, :pStatus)';

   with DM_Pesq.Qry_Geral do
   begin
       close;
       sql.Clear;
       sql.Add(_Sql);
       ParamByName('pIDDuplicata').AsInteger   := self.id_duplicata;;
       ParamByName('pIDPedido').AsInteger      := self.pedido_id;
       ParamByName('pNumDuplicata').AsString   := self.num_duplicata;
       ParamByName('pValor').AsFloat           := self.valor;
       ParamByName('pVencto').AsDateTime       := self.dtvencimento;
       ParamByName('pDataCad').AsDateTime      := self.dataCad;
       ParamByName('pMesano').AsString         := self.mesano;
       ParamByName('pStatus').AsString         := self.status;
       try
          ExecSQL();
          Result := True;

      except
          Result := False;

      end;
    end;
end;

function TDuplicata.atualizar:Boolean;
begin
   //Nao é necessário passar o id como set de atualização pois o mesmo não é atualizavel, passe apenas como parametro de identificaçao do registro a ser atualizado
   _Sql := 'UPDATE duplicatas SET pedido_id=:pIDPedido, num_duplicata=:pNumDuplicata, valor=:pValor, '+
           'dtvencimento=:pVencto, dtpagamento=:pPagto, datacad=:pDataCad, mesano=:pMesano, status=:pStatus '+
           'WHERE id_duplicata=:pIDDuplicata';

   with DM_Pesq.Qry_Geral do
   begin
        close;
        sql.Clear;
        sql.Add(_Sql);
        ParamByName('pIDDuplicata').AsInteger      := self.id_duplicata;
        ParamByName('pIDPedido').AsInteger         := self.pedido_id;
        ParamByName('pNumDuplicata').AsString      := self.num_duplicata;
        ParamByName('pValor').AsFloat              := self.valor;
        ParamByName('pVencto').AsDateTime          := self.dtvencimento;
        ParamByName('pPagto').AsDateTime           := self.dtpagamento;
        ParamByName('pDataCad').AsDateTime         := self.dataCad;
        ParamByName('pMesano').AsString            := self.mesano;
        ParamByName('pStatus').AsString            := self.status;
       try
          ExecSQL();
          Result := True;

      except
          Result := False;

      end;
    end;
end;

function TDuplicata.excluir(pCodigo: integer): Boolean;
begin
   _Sql := ('DELETE FROM duplicatas WHERE id_duplicata = :pID');

   with DM_Pesq.Qry_Geral do
   begin
       close;
       sql.Clear;
       sql.Add(_Sql);
       Params.ParamByName('pID').AsInteger := pCodigo;
       try
          ExecSQL();
          Result := True;

      except
          Result := False;

      end;
    end;
end;

function TDuplicata.pesquisar(pCodigo: integer): Boolean;
begin
    with dm_Conexao.cds_Duplicatas do
    begin
      Close;
      CommandText:=('SELECT * FROM DUPLICATAS WHERE ID_DUPLICATA = :pID');
      Params.ParamByName('pID').AsInteger := pCodigo;
      Open;

        if not IsEmpty then
        begin
            self.id_duplicata     :=  dm_Conexao.cds_Duplicatas.FieldByName('id_duplicata').AsInteger;
            self.pedido_id        :=  dm_Conexao.cds_Duplicatas.FieldByName('pedido_id').AsInteger;
            self.num_duplicata    :=  dm_Conexao.cds_Duplicatas.FieldByName('num_duplicata').AsString;
            self.valor            :=  dm_Conexao.cds_Duplicatas.FieldByName('valor').AsFloat;
            self.dtvencimento     :=  dm_Conexao.cds_Duplicatas.FieldByName('dtvencimento').AsDateTime;
            self.dtpagamento      :=  dm_Conexao.cds_Duplicatas.FieldByName('dtpagamento').AsDateTime;
            self.datacad          :=  dm_Conexao.cds_Duplicatas.FieldByName('datacad').AsDateTime;
            self.mesano           :=  dm_Conexao.cds_Duplicatas.FieldByName('mesano').AsString;
            self.status           :=  dm_Conexao.cds_Duplicatas.FieldByName('status').AsString;
            Result                :=  true;

        end else begin
          Result  := false;

        end;

     end;
end;

end.
