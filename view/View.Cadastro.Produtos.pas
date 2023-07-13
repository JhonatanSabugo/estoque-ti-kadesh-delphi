unit View.Cadastro.Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, DAO.Produtos, Classe.Produtos, DMConnection,
  Vcl.ExtCtrls;

type
  TFrmCadProd = class(TForm)
    Label1: TLabel;
    EdtNomeProd: TEdit;
    Label2: TLabel;
    EdtMarca: TEdit;
    Label3: TLabel;
    EdtObs: TMemo;
    BtSalvar: TSpeedButton;
    BtDelete: TSpeedButton;
    DBGrid1: TDBGrid;
    EdtPesquisar: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure EdtPesquisarClick(Sender: TObject);
    procedure EdtPesquisarChange(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Produto : TProduto;
    DAOProduto : TDAOProdutos;
  end;

var
  FrmCadProd: TFrmCadProd;

implementation

{$R *.dfm}

procedure TFrmCadProd.BtDeleteClick(Sender: TObject);
begin
  DAOProduto.DeleteProduto;
end;

procedure TFrmCadProd.BtSalvarClick(Sender: TObject);
begin
  try
    Produto := TProduto.Create;
    DAOProduto := TDAOProdutos.Create;

    Produto.Produto := EdtNomeProd.Text;
    Produto.Marca := EdtMarca.Text;
    Produto.Observacao := EdtObs.Text;
    Produto.Qtd := 0;

    DAOProduto.InserirProduto(Produto);
    DAOProduto.PesquisarProduto(EdtNomeProd.Text);

    EdtNomeProd.Clear;
    EdtMarca.Clear;
    EdtObs.Clear;
    EdtNomeProd.SetFocus;
  finally
    Produto.DisposeOf;
    DAOProduto.DisposeOf;
  end;
end;

procedure TFrmCadProd.EdtPesquisarChange(Sender: TObject);
begin
  DAOProduto.PesquisarProduto(EdtPesquisar.Text);
end;

procedure TFrmCadProd.EdtPesquisarClick(Sender: TObject);
begin
  EdtPesquisar.Clear;
end;

procedure TFrmCadProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.DsProdutos.DataSet.Close;
end;

end.
