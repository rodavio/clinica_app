class PrestadorsController < ApplicationController
  before_action :set_prestador, only: %i[ show edit update destroy ]

  # GET /prestadors or /prestadors.json
  def index
    @prestadors = Prestador.all
  end

  # GET /prestadors/1 or /prestadors/1.json
  def show
  end

  # GET /prestadors/new
  def new
    @prestador = Prestador.new
  end

  # GET /prestadors/1/edit
  def edit
  end

  # POST /prestadors or /prestadors.json
  def create
    @prestador = Prestador.new(prestador_params)

    respond_to do |format|
      if @prestador.save
        format.html { redirect_to @prestador, notice: "Prestador was successfully created." }
        format.json { render :show, status: :created, location: @prestador }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @prestador.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /prestadors/1 or /prestadors/1.json
  def update
    respond_to do |format|
      if @prestador.update(prestador_params)
        format.html { redirect_to @prestador, notice: "Prestador was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @prestador }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @prestador.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /prestadors/1 or /prestadors/1.json
  def destroy
    @prestador.destroy!

    respond_to do |format|
      format.html { redirect_to prestadors_path, notice: "Prestador was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestador
      @prestador = Prestador.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def prestador_params
      params.expect(prestador: [ :nome_completo, :especialidade, :registro_profissional, :telefone, :email, :status ])
    end
end
