unit DMConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.MSAccDef, FireDAC.Comp.UI,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc;

type
  TDM = class(TDataModule)
    conexao: TFDConnection;
    QryProdutos: TFDQuery;
    DsProdutos: TDataSource;
    QryProdutosID: TFDAutoIncField;
    QryProdutosProduto: TStringField;
    QryProdutosMarca: TStringField;
    QryProdutosQtd: TIntegerField;
    QryProdutosObservacoes: TStringField;
    QryMovimentacao: TFDQuery;
    DsMovimentacoes: TDataSource;
    QryMovimentacaoID: TFDAutoIncField;
    QryMovimentacaoID_Produto: TIntegerField;
    QryMovimentacaoProduto: TStringField;
    QryMovimentacaoTipo: TStringField;
    QryMovimentacaoResponsavel: TStringField;
    QryMovimentacaoQtd: TIntegerField;
    QryMovimentacaoData: TDateTimeField;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
