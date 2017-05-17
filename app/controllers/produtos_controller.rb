class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  # GET /produtos
  # GET /produtos.json
  def index
    if (params[:department_id])
      @produtos = Produto.where(department_id: params[:department_id])
    else
      @produtos = Produto.all
    end

    @shopping_cart_item = current_shopping_cart.shopping_cart_items.new
    @departments = Department.all
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_produto
    @produto = Produto.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def produto_params
    params.require(:produto).permit(:nome, :valor, :quantidade, :descricao)
  end
end
