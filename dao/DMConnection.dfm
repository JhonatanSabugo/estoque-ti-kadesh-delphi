object DM: TDM
  OldCreateOrder = False
  Height = 344
  Width = 487
  object conexao: TFDConnection
    Params.Strings = (
      'Database=*****'
      'User_Name=****'
      'Password=******'
      'Server=*****'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 208
    Top = 8
  end
  object QryProdutos: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'Select * from produtos_ti')
    Left = 32
    Top = 72
    object QryProdutosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryProdutosProduto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto'
      Origin = 'Produto'
      Size = 30
    end
    object QryProdutosMarca: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Marca'
      Origin = 'Marca'
      Size = 30
    end
    object QryProdutosQtd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd'
      Origin = 'Qtd'
    end
    object QryProdutosObservacoes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Observacoes'
      Origin = 'Observacoes'
      Size = 200
    end
  end
  object DsProdutos: TDataSource
    DataSet = QryProdutos
    Left = 136
    Top = 72
  end
  object QryMovimentacao: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'select * from movimentacoes_ti')
    Left = 32
    Top = 160
    object QryMovimentacaoID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryMovimentacaoID_Produto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_Produto'
      Origin = 'ID_Produto'
    end
    object QryMovimentacaoProduto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto'
      Origin = 'Produto'
      Size = 25
    end
    object QryMovimentacaoTipo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Size = 10
    end
    object QryMovimentacaoResponsavel: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Responsavel'
      Origin = 'Responsavel'
    end
    object QryMovimentacaoQtd: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Qtd'
      Origin = 'Qtd'
    end
    object QryMovimentacaoData: TDateTimeField
      FieldName = 'Data'
      Origin = '`Data`'
      Required = True
    end
  end
  object DsMovimentacoes: TDataSource
    DataSet = QryMovimentacao
    Left = 136
    Top = 160
  end
  object FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink
    VendorLib = 'C:\sistema Ti\libmysql.dll'
    Left = 392
    Top = 72
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 392
    Top = 160
  end
end
