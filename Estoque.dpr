program Estoque;

uses
  Vcl.Forms,
  View.Main in 'view\View.Main.pas' {FrmPrincipal},
  View.Estoque in 'view\View.Estoque.pas' {FrmEstoque},
  View.Cadastro.Produtos in 'view\View.Cadastro.Produtos.pas' {FrmCadProd},
  View.Movimentacoes in 'view\View.Movimentacoes.pas' {FrmMovimentacao},
  Classe.Produtos in 'model\Classe.Produtos.pas',
  Classe.Movimentacao in 'model\Classe.Movimentacao.pas',
  DMConnection in 'dao\DMConnection.pas' {DM: TDataModule},
  DAO.Produtos in 'dao\DAO.Produtos.pas',
  ComboBox.Helper in 'model\ComboBox.Helper.pas',
  DAO.Movimentacoes in 'dao\DAO.Movimentacoes.pas',
  DMRelatorio in 'DAO\DMRelatorio.pas' {DMRelat: TDataModule},
  View.Requisicao in 'view\View.Requisicao.pas' {FrmRequisicao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMRelat, DMRelat);
  Application.CreateForm(TFrmRequisicao, FrmRequisicao);
  Application.Run;
end.
