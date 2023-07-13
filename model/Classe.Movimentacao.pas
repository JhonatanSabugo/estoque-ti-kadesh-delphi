unit Classe.Movimentacao;

interface

uses
  System.SysUtils;

type
  TMovimentacao = class

  private
    FProduto: Integer;
    FQtd: Integer;
    FResponsavel: String;
    FTipo: String;
    FData: TDate;
    procedure SetData(const Value: TDate);
    procedure SetProduto(const Value: Integer);
    procedure SetQtd(const Value: Integer);
    procedure SetResponsavel(const Value: String);
    procedure SetTipo(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    property Produto: Integer read FProduto write SetProduto;
    property Tipo: String read FTipo write SetTipo;
    property Responsavel: String read FResponsavel write SetResponsavel;
    property Qtd: Integer read FQtd write SetQtd;
    property Data: TDate read FData write SetData;
  end;

implementation

{ TMovimentacao }

constructor TMovimentacao.Create;
begin

end;

destructor TMovimentacao.Destroy;
begin

  inherited;
end;

procedure TMovimentacao.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TMovimentacao.SetProduto(const Value: Integer);
begin
  FProduto := Value;
end;

procedure TMovimentacao.SetQtd(const Value: Integer);
begin
  if Value = 0 then
    raise Exception.Create('A quantidade não pode ser zero!');

  FQtd := Value;
end;

procedure TMovimentacao.SetResponsavel(const Value: String);
begin
  if Value = '' then
    raise Exception.Create('Responsavel não identificado');

  FResponsavel := Value;
end;

procedure TMovimentacao.SetTipo(const Value: String);
begin
  FTipo := Value;
end;

end.
