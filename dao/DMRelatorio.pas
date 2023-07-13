unit DMRelatorio;

interface

uses
  System.SysUtils, System.Classes, DMConnection, frxClass, frxDBSet,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDMRelat = class(TDataModule)
    Rel_Estoque_TI: TfrxReport;
    DSRel_Estoque: TfrxDBDataset;
    Rel_Requisicao_ti: TfrxReport;
    DSRel_Requisicao: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelat: TDMRelat;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
