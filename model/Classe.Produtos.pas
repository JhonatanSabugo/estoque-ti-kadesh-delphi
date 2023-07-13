unit Classe.Produtos;

interface

type
  TProduto = class

  private
    FProduto: String;
    FObservacao: String;
    FQtd: Integer;
    FMarca: String;
    procedure SetMarca(const Value: String);
    procedure SetObservacao(const Value: String);
    procedure SetProduto(const Value: String);
    procedure SetQtd(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    property Produto: String read FProduto write SetProduto;
    property Marca: String read FMarca write SetMarca;
    property Observacao: String read FObservacao write SetObservacao;
    property Qtd: Integer read FQtd write SetQtd;
  end;

implementation

{ TProduto }

constructor TProduto.Create;
begin

end;

destructor TProduto.Destroy;
begin

  inherited;
end;

procedure TProduto.SetMarca(const Value: String);
begin
  FMarca := Value;
end;

procedure TProduto.SetObservacao(const Value: String);
begin
  FObservacao := Value;
end;

procedure TProduto.SetProduto(const Value: String);
begin
  FProduto := Value;
end;

procedure TProduto.SetQtd(const Value: Integer);
begin
  FQtd := Value;
end;

end.
