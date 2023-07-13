unit DAO.Produtos;

interface

uses DMConnection, Classe.Produtos, Winapi.Windows, Vcl.Forms, Vcl.Controls;

type
  TDAOProdutos = class

  private
  public
  constructor Create;
  destructor Destroy; override;
  procedure InserirProduto(Value: TProduto);
  procedure PesquisarProduto(Value: String);
  procedure DeleteProduto;
  end;

implementation

{ TDAOProdutos }

constructor TDAOProdutos.Create;
begin

end;

procedure TDAOProdutos.DeleteProduto;
begin
  if DM.QryProdutos.IsEmpty then
    Exit;

  if Application.MessageBox('Deseja excluir esse Produto?','Atenção', MB_ICONQUESTION + MB_YESNO) = mrYes then
    Begin
      DM.QryProdutos.Delete;
    End;

end;

destructor TDAOProdutos.Destroy;
begin

  inherited;
end;

procedure TDAOProdutos.InserirProduto(Value: TProduto);
begin
  with DM.QryProdutos do
    Begin
      SQL.Clear;
      SQL.Text:='INSERT INTO PRODUTOS_TI (Produto,Marca,Observacoes,Qtd) VALUES (:pProduto, :pMarca, :pObs, :pQtd)';
      ParamByName('pProduto').AsString:= Value.Produto;
      ParamByName('pMarca').AsString:= Value.Marca;
      ParamByName('pObs').AsString:= Value.Observacao;
      ParamByName('pQtd').AsInteger:= Value.Qtd;
      ExecSQL;
    End;
end;

procedure TDAOProdutos.PesquisarProduto(Value: String);
var
  filtro: String;
begin
  if Value = ' ' then
    Begin
      With DM.QryProdutos do
        Begin
          SQL.Clear;
          SQL.Text:='SELECT * FROM PRODUTOS_TI';
          Open();
        End;
    End
  else
    Begin
      filtro:= Value;
      with DM.QryProdutos do
        Begin
          SQL.Clear;
          SQL.Text:='SELECT * FROM PRODUTOS_TI WHERE Produto LIKE :pFiltro';
          ParamByName('pFiltro').AsString:= filtro + '%';
          Open();
        End;
    End;
end;

end.
