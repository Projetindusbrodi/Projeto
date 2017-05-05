module Admin
  class ProdutosController < AdminController
    before_action :set_produto, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    # GET /produtos
    # GET /produtos.json
    def index
      @produtos = Produto.all
      @order_item = current_order.order_items.new
    end

    # GET /produtos/1
    # GET /produtos/1.json
    def show
    end

    # GET /produtos/new
    def new
      @produto = Produto.new
    end

    # GET /produtos/1/edit
    def edit
    end

    # POST /produtos
    # POST /produtos.json
    def create
      @produto = Produto.new(produto_params)

      respond_to do |format|
        if @produto.save
          format.html { redirect_to admin_produto_path(@produto), notice: 'Produto was successfully created.' }
          format.json { render :show, status: :created, location: @produto }
        else
          format.html { render :new }
          format.json { render json: @produto.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /produtos/1
    # PATCH/PUT /produtos/1.json
    def update
      respond_to do |format|
        Notification.notify_user(@produto, produto_params[:quantidade].to_i)

        if @produto.update(produto_params)
          format.html { redirect_to admin_produto_path(@produto), notice: 'Produto was successfully updated.' }
          format.json { render :show, status: :ok, location: @produto }
        else
          format.html { render :edit }
          format.json { render json: @produto.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /produtos/1
    # DELETE /produtos/1.json
    def destroy
      @produto.destroy
      respond_to do |format|
        format.html { redirect_to admin_produtos_url, notice: 'Produto was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_produto
        @produto = Produto.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def produto_params
        params.require(:produto).permit(:nome, :valor, :quantidade, :descricao, :image)
      end
  end
end
