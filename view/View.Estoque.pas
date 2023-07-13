unit View.Estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, DMConnection, DAO.Produtos, DMRelatorio;

type
  TFrmEstoque = class(TForm)
    Panel1: TPanel;
    EdtPesquisar: TEdit;
    DBGrid1: TDBGrid;
    Button1: TButton;
    procedure EdtPesquisarClick(Sender: TObject);
    procedure EdtPesquisarChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DAOProdutos : TDAOProdutos;
  end;

var
  FrmEstoque: TFrmEstoque;

implementation

{$R *.dfm}

procedure TFrmEstoque.Button1Click(Sender: TObject);
begin
  DMRelat.Rel_Estoque_TI.ShowReport();
end;

procedure TFrmEstoque.EdtPesquisarChange(Sender: TObject);
begin
  DAOProdutos.PesquisarProduto(EdtPesquisar.Text);
end;

procedure TFrmEstoque.EdtPesquisarClick(Sender: TObject);
begin
  EdtPesquisar.Clear;
end;

procedure TFrmEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.DsProdutos.DataSet.Close;
end;

end.
