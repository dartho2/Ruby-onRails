class CuriersController < ApplicationController
  before_action :set_curier, only: [:show, :edit, :update, :destroy]

  # GET /curiers
  # GET /curiers.json
  def index
    @curiers = Curier.all
  end

  # GET /curiers/1
  # GET /curiers/1.json
  def show
  end

  # GET /curiers/new
  def new
    @curier = Curier.new
  end

  # GET /curiers/1/edit
  def edit
  end

  # POST /curiers
  # POST /curiers.json
  def create
    @curier = Curier.new(curier_params)

    respond_to do |format|
      if @curier.save
        format.html { redirect_to @curier, notice: 'Curier was successfully created.' }
        format.json { render :show, status: :created, location: @curier }
      else
        format.html { render :new }
        format.json { render json: @curier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curiers/1
  # PATCH/PUT /curiers/1.json
  def update
    respond_to do |format|
      if @curier.update(curier_params)
        format.html { redirect_to @curier, notice: 'Curier was successfully updated.' }
        format.json { render :show, status: :ok, location: @curier }
      else
        format.html { render :edit }
        format.json { render json: @curier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curiers/1
  # DELETE /curiers/1.json
  def destroy
    @curier.destroy
    respond_to do |format|
      format.html { redirect_to curiers_url, notice: 'Curier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curier
      @curier = Curier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curier_params
      params.fetch(:curier, {})
    end
end
