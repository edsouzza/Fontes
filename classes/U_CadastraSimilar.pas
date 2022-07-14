unit U_CadastraSimilar;

interface
uses Controls, u_dmDados, u_biblioSysSalao;
  Type TSimilar = class  
  private
       FIdSimilar     : integer;
       FProdutoId     : integer;
       FUsuarioId     : integer;
       FIdProdSimilar : integer;
       FDataCad       : TDate;

  public
       constructor criarObj;
       destructor Destroy; override;
       property idSimilar     : integer read FIdSimilar     write FIdSimilar;
       property idProduto     : integer read FProdutoId     write FProdutoId;
       property idUsuario     : integer read FUsuarioId     write FUsuarioId;
       property idProdSimilar : integer read FIdProdSimilar write FIdProdSimilar;
       property dataCad       : TDate   read FDataCad       write FDataCAd;

       Function inserir   : boolean;
       Function atualizar (pCodigo: integer): Boolean;
       Function excluir   (pCodigo: integer): Boolean;
       Function pesquisar(pCodigo: integer): Boolean;

  end;

implementation

{ TSimilar }

constructor TSimilar.criarObj;
begin
    idSimilar     := 0;
    idProduto     := 0;
    idUsuario     := 0;
    idProdSimilar := 0;
    dataCad       := 0;

end;

destructor TSimilar.Destroy;
begin    
  inherited;
end;

function TSimilar.atualizar (pCodigo: integer): Boolean;
begin
   with dm_Conexao.cds_Similares do
   begin
        edit;
        FieldByName('id_similar').AsInteger          := self.idSimilar;
        FieldByName('produto_id').AsInteger          := self.idProduto;
        FieldByName('usuario_id').AsInteger          := self.idUsuario;
        FieldByName('id_produtosimilar').AsInteger   := self.idProdSimilar;
        FieldByName('datacad').AsDateTime            := self.dataCad;
       try
          ApplyUpdates(0);
          Result := True;

      except
          Result := False;

      end;
    end;

end;

function TSimilar.excluir(pCodigo: integer): Boolean;
begin
   with dm_Conexao.cds_Similares do
   begin 
      Delete;
      ApplyUpdates(0);

   try
      Result := True;

    except
      Result := False;

     end;

   end;
end;

function TSimilar.inserir: boolean;
begin
   with dm_Conexao.cds_Similares do
   begin
        append;
        FieldByName('id_similar').AsInteger          := self.idSimilar;
        FieldByName('produto_id').AsInteger          := self.idProduto;
        FieldByName('usuario_id').AsInteger          := self.idUsuario;
        FieldByName('id_produtosimilar').AsInteger   := self.idProdSimilar;
        FieldByName('datacad').AsDateTime            := self.dataCad;
       try
          ApplyUpdates(0);
          Result := True;

      except
          Result := False;

      end;
    end;

end;

function TSimilar.pesquisar(pCodigo: integer): Boolean;
begin
    with dm_Conexao.cds_Similares do
    begin
      Close;
      CommandText:=('SELECT * FROM SIMILARES WHERE ID_SIMILAR = :pID');
      Params.ParamByName('pID').AsInteger := pCodigo;
      Open;

        if not IsEmpty then
        begin
            self.idSimilar        :=  dm_Conexao.cds_Similares.FieldByName('id_similar').AsInteger;
            self.idProduto        :=  dm_Conexao.cds_Similares.FieldByName('produto_id').AsInteger;
            self.idUsuario        :=  dm_Conexao.cds_Similares.FieldByName('usuario_id').AsInteger;
            self.idProdSimilar    :=  dm_Conexao.cds_Similares.FieldByName('id_produtosimilar').AsInteger;
            self.dataCad          :=  dm_Conexao.cds_Similares.FieldByName('datacad').AsDateTime;
            Result                := true;

        end else begin
          Result  := false;

        end;

     end;
end;

end.
