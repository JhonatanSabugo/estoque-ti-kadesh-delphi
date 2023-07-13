unit View.Movimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, ComboBox.Helper, Classe.Movimentacao,
  DAO.Movimentacoes, DMConnection, DMRelatorio;

type
  TFrmMovimentacao = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtSalvar: TSpeedButton;
    BtDeletar: TSpeedButton;
    Label4: TLabel;
    LabelDateTime: TLabel;
    BtRequisicao: TSpeedButton;
    RadioGroup: TRadioGroup;
    cbProdutos: TComboBox;
    edtResponsavel: TEdit;
    edtQTD: TEdit;
    Timer1: TTimer;
    DBGrid1: TDBGrid;
    EdtReq: TEdit;
    Label5: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbProdutosSelect(Sender: TObject);
    procedure RadioGroupClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure BtDeletarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtRequisicaoClick(Sender: TObject);

  private
    { Private declarations }
    Tipo: String;
  public
    { Public declarations }
    Movimentacao: TMovimentacao;
    DAOMovimentacao: TDAOMovimentacao;
  end;

var
  FrmMovimentacao: TFrmMovimentacao;

implementation

{$R *.dfm}

procedure TFrmMovimentacao.BtDeletarClick(Sender: TObject);
begin
  DAOMovimentacao.DeletarMovimentacao((Integer(cbProdutos.Items.Objects[cbProdutos.ItemIndex])),
    DM.DsMovimentacoes.DataSet.FieldByName('QTD').AsString,
    DM.DsMovimentacoes.DataSet.FieldByName('Tipo').AsString);
end;

procedure TFrmMovimentacao.BtRequisicaoClick(Sender: TObject);
begin
  DAOMovimentacao.RelatRequisicao(EdtReq.Text, DM.DsMovimentacoes.DataSet.FieldByName('data').AsString);

  DMRelat.Rel_Requisicao_ti.ShowReport();

  DAOMovimentacao.AbrirMovimentacao((integer(cbProdutos.Items.Objects[cbProdutos.ItemIndex])));
end;

procedure TFrmMovimentacao.BtSalvarClick(Sender: TObject);
begin
  try
    Movimentacao := TMovimentacao.Create;
    DAOMovimentacao := TDAOMovimentacao.Create;

    Movimentacao.Produto := (Integer(cbProdutos.Items.Objects[cbProdutos.ItemIndex]));
    Movimentacao.Tipo := Tipo;
    Movimentacao.Responsavel := edtResponsavel.Text;
    Movimentacao.Qtd := StrToInt(edtQTD.Text);
    Movimentacao.Data := StrToDate(LabelDateTime.Caption);

    DAOMovimentacao.BuscaProduto((Integer(cbProdutos.Items.Objects[cbProdutos.ItemIndex])));
    DAOMovimentacao.InserirMovimento(Movimentacao);
    DAOMovimentacao.AtualizarEstoque((Integer(cbProdutos.Items.Objects[cbProdutos.ItemIndex])),
      edtQTD.Text, tipo);
    DAOMovimentacao.AbrirMovimentacao(Integer(cbProdutos.Items.Objects[cbProdutos.ItemIndex]));

    cbProdutos.SetFocus;

  finally
    Movimentacao.DisposeOf;
    DAOMovimentacao.DisposeOf;
  end;
end;

procedure TFrmMovimentacao.cbProdutosSelect(Sender: TObject);
begin
  DAOMovimentacao.AbrirMovimentacao
    (Integer(cbProdutos.Items.Objects[cbProdutos.ItemIndex]));
end;

procedure TFrmMovimentacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm.DsMovimentacoes.DataSet.Close;
end;

procedure TFrmMovimentacao.FormCreate(Sender: TObject);
begin
  cbProdutos.CarregaComboProduto;
end;

procedure TFrmMovimentacao.RadioGroupClick(Sender: TObject);
begin
  case RadioGroup.ItemIndex of
    0:
      Tipo := 'Entrada';
    1:
      Tipo := 'Saida';
  end;

  end;

procedure TFrmMovimentacao.Timer1Timer(Sender: TObject);
begin
  LabelDateTime.Caption:= DateToStr(now);
end;

end.
