unit View.Requisicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmRequisicao = class(TForm)
    EdtObs: TMemo;
    Observação: TLabel;
    EdtItens: TEdit;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRequisicao: TFrmRequisicao;

implementation

{$R *.dfm}

end.
