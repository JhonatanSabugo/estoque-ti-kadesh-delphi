unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage, Vcl.CategoryButtons, Vcl.WinXCtrls, System.ImageList,
  Vcl.ImgList, View.Estoque, View.Cadastro.Produtos, View.Movimentacoes;

type
  TFrmPrincipal = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Image2: TImage;
    SplitView: TSplitView;
    CbMenus: TCategoryButtons;
    ImageList1: TImageList;
    CbLogout: TCategoryButtons;
    procedure Image2Click(Sender: TObject);
    procedure CbLogoutCategories0Items0Click(Sender: TObject);
    procedure CbMenusCategories0Items0Click(Sender: TObject);
    procedure CbMenusCategories0Items1Click(Sender: TObject);
    procedure CbMenusCategories0Items2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.CbLogoutCategories0Items0Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.CbMenusCategories0Items0Click(Sender: TObject);
begin
  try
    FrmEstoque:= TFrmEstoque.Create(self);
    FrmEstoque.ShowModal;
  finally
    FreeAndNil(FrmEstoque);
  end;


end;

procedure TFrmPrincipal.CbMenusCategories0Items1Click(Sender: TObject);
begin
  try
    FrmCadProd:= TFrmCadProd.Create(self);
    FrmCadProd.ShowModal;
  finally
    FreeAndNil(FrmCadProd);
  end;
end;

procedure TFrmPrincipal.CbMenusCategories0Items2Click(Sender: TObject);
begin
  try
    FrmMovimentacao:= TFrmMovimentacao.Create(self);
    FrmMovimentacao.ShowModal;
  finally
    FreeAndNil(FrmMovimentacao);
  end;
end;

procedure TFrmPrincipal.Image2Click(Sender: TObject);
begin
  if SplitView.Opened then
    begin
      SplitView.Close;
    end
  else
    begin
      SplitView.Open;
    end;
end;

end.
