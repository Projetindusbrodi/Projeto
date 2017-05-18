module OrdersHelper
  def product_name(produtoid)
    Produto.find_by(id: produtoid)
  end
end
