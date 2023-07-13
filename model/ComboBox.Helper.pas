unit ComboBox.Helper;

interface

uses
  Vcl.StdCtrls, System.SysUtils, DMConnection;

type
  THelperEnunToCombo = class Helper for TComboBox

  private
  public
    procedure CarregaComboProduto;
  end;


implementation

{ THelperEnunToCombo }

procedure THelperEnunToCombo.CarregaComboProduto;
begin
  Self.Clear;
  with DM.QryProdutos do
    begin
      active := false;
      SQL.Text := 'SELECT * FROM Produtos_ti';
      active := true;
    end;

  if DM.QryProdutos.RecordCount > 0 then
    begin
      DM.QryProdutos.First;
      while not DM.QryProdutos.Eof do
        Begin
          Self.Items.AddObject(DM.QryProdutos.FieldByName('Produto').AsString,
            TObject(DM.QryProdutos.FieldByName('id').AsInteger));
          DM.QryProdutos.Next;
        End;
    end;
end;

end.
