json.extract! produto, :id, :nome, :valor, :quantidade, :descricao, :created_at, :updated_at
json.url produto_url(produto, format: :json)
