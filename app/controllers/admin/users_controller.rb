module Admin
  class UsersController < AdminController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    # GET /alunos
    # GET /alunos.json
    def index
      @alunos = User.all
    end

    # GET /alunos/1
    # GET /alunos/1.json
    def show
    end

    # GET /alunos/new
    def new
      @aluno = User.new
    end

    # GET /alunos/1/edit
    def edit
    end

    # POST /alunos
    # POST /alunos.json
    def create
      @aluno = User.new(aluno_params)

      respond_to do |format|
        if @aluno.save
          format.html { redirect_to admin_user_path(@aluno), notice: 'Aluno was successfully created.' }
          format.json { render :show, status: :created, location: @aluno }
        else
          format.html { render :new }
          format.json { render json: @aluno.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /alunos/1
    # PATCH/PUT /alunos/1.json
    def update
      respond_to do |format|
        if @aluno.update(aluno_params)
          format.html { redirect_to admin_user_path(@aluno), notice: 'Aluno was successfully updated.' }
          format.json { render :show, status: :ok, location: @aluno }
        else
          format.html { render :edit }
          format.json { render json: @aluno.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /alunos/1
    # DELETE /alunos/1.json
    def destroy
      @aluno.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_url, notice: 'Aluno was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @aluno = User.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def aluno_params
        params.require(:user).permit(:ra, :name, :password, :email)
      end
  end
end
