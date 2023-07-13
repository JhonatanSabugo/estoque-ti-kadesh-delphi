unit DAO.Movimentacoes;

interface

uses Classe.Movimentacao, DMConnection, System.SysUtils, Vcl.Forms,
  Winapi.Windows, Vcl.Controls;

type
  TDAOMovimentacao = class

  private
  public
    constructor Create;
    destructor Destroy; override;
    procedure InserirMovimento(Value: TMovimentacao);
    procedure AtualizarEstoque(Produto: Integer; Qtd, Tipo: string);
    procedure DeletarMovimentacao(Produto: Integer; Qtd, Tipo: String);
    procedure AbrirMovimentacao (const CodProduto: Integer);
    procedure BuscaProduto(Value: Integer);
    procedure RelatRequisicao (Itens: String; Date: String);
  end;

var
  Produto: String;

implementation

{ TDAOMovimentacao }

procedure TDAOMovimentacao.AbrirMovimentacao(const CodProduto: Integer);
begin
  with DM.QryMovimentacao do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM Movimentacoes_ti WHERE Id_Produto = :Produto');
    ParamByName('Produto').AsInteger := CodProduto;
    Active := True;
  end;
end;

procedure TDAOMovimentacao.AtualizarEstoque(Produto: Integer;
  Qtd, Tipo: string);
begin
  if Qtd = '0' then
    raise Exception.Create('Quantidade não é valida');

  if Tipo = 'Entrada' then
  begin
    with DM.QryProdutos do
    Begin
      active := false;
      SQL.Clear;
      SQL.Text := 'Update Produtos_ti SET Qtd = Qtd + :pQtd WHERE id = :pID';
      ParamByName('pQtd').AsInteger := StrToInt(Qtd);
      ParamByName('pId').AsInteger := Produto;
      ExecSQL;
    End;
  end

  else if Tipo = 'Saida' then
  begin
    with DM.QryProdutos do
    Begin
      active := false;
      SQL.Clear;
      SQL.Text := 'Update Produtos_ti SET Qtd = Qtd - :pQtd WHERE id = :pId';
      ParamByName('pQtd').AsInteger := StrToInt(Qtd);
      ParamByName('pId').AsInteger := Produto;
      ExecSQL;
    End;
  end;
end;

procedure TDAOMovimentacao.BuscaProduto(Value: Integer);
begin
  with DM.QryProdutos do
  begin
    Active := False;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM Produtos_ti WHERE id = :Produto';
    ParamByName('Produto').AsInteger := Value;
    Active := True;

    Produto := DM.DsProdutos.DataSet.FieldByName('Produto').AsString;
  end;
end;

constructor TDAOMovimentacao.Create;
begin

end;

procedure TDAOMovimentacao.DeletarMovimentacao(Produto: Integer;
  Qtd, Tipo: String);
begin
  if DM.DsMovimentacoes.DataSet.IsEmpty then
    Exit;

  if Application.MessageBox('Deseja excluir essa movimentação ?', 'Atenção',
    MB_ICONQUESTION + MB_YESNO) = mrYes then
  begin
    if Tipo = 'Entrada' then
    begin
      With DM.QryProdutos do
      begin
        active := false;
        SQL.Clear;
        SQL.Text := 'UPDATE Produtos_ti SET Qtd = Qtd - :pQtd WHERE Id = :pId';
        ParamByName('pQtd').AsInteger := StrToInt(Qtd);
        ParamByName('pId').AsInteger := Produto;
        ExecSQL;
      end;
    end

    else if Tipo = 'Saida' then
    begin
      with DM.QryProdutos do
      begin
        active := false;
        SQL.Clear;
        SQL.Text := 'UPDATE Produtos_ti SET Qtd = Qtd + :pQtd WHERE Id = :pId';
        ParamByName('pQtd').AsInteger := StrToInt(Qtd);
        ParamByName('pId').AsInteger := Produto;
        ExecSQL;
      end;
    end;
  end;

  DM.DsMovimentacoes.DataSet.Delete;

end;

destructor TDAOMovimentacao.Destroy;
begin

  inherited;
end;

procedure TDAOMovimentacao.InserirMovimento(Value: TMovimentacao);
begin
  with DM.QryMovimentacao do
  begin
    close;
    SQL.Clear;
    SQL.Add('INSERT INTO Movimentacoes_ti (id_produto, Produto, tipo, responsavel, qtd, data) VALUES (:pId_produto, :pProduto, :pTipo, :pResponsavel, :pQtd, :pData)');
    ParamByName('pId_produto').AsInteger := Value.Produto;
    ParamByName('pProduto').AsString := Produto;
    ParamByName('pTipo').AsString := Value.Tipo;
    ParamByName('pResponsavel').AsString := Value.Responsavel;
    ParamByName('pQtd').AsInteger := Value.Qtd;
    ParamByName('pData').AsDate := Value.Data;
    ExecSQL;
  end;
end;

procedure TDAOMovimentacao.RelatRequisicao(Itens: String; Date: String);
begin
  with DM.QryMovimentacao do
  begin
    active:= false;
    SQL.Clear;
    SQL.Text:='SELECT * FROM MOVIMENTACOES_TI WHERE data = :pData order by id desc limit :pItens';
    ParamByName('pData').AsString := FormatDateTime('yyyy-mm-dd', StrToDate(date));
    ParamByName('pItens').AsString := Itens;
    Open;
  end;
end;

end.
