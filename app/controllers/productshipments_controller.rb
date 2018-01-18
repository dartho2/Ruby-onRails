class ProductshipmentsController < ApplicationController
  before_action :set_productshipment, only: [:show, :edit, :update, :destroy]

  # GET /productshipments
  # GET /productshipments.json
  def index
    @productshipments = Productshipment.all
  end

  # GET /productshipments/1
  # GET /productshipments/1.json
  def show
  end

  # GET /productshipments/new
  def new
    @productshipment = Productshipment.new
  end

  # GET /productshipments/1/edit
  def edit
  end

  # POST /productshipments
  # POST /productshipments.json
  def create
    @productshipment = Productshipment.new(productshipment_params)

    respond_to do |format|
      if @productshipment.save
        format.html { redirect_to @productshipment, notice: 'Productshipment was successfully created.' }
        format.json { render :show, status: :created, location: @productshipment }
      else
        format.html { render :new }
        format.json { render json: @productshipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productshipments/1
  # PATCH/PUT /productshipments/1.json
  def update
    respond_to do |format|
      if @productshipment.update(productshipment_params)
        format.html { redirect_to @productshipment, notice: 'Productshipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @productshipment }
      else
        format.html { render :edit }
        format.json { render json: @productshipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productshipments/1
  # DELETE /productshipments/1.json
  def destroy
    @productshipment.destroy
    respond_to do |format|
      format.html { redirect_to productshipments_url, notice: 'Productshipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productshipment
      @productshipment = Productshipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productshipment_params
      params.fetch(:productshipment, {})
    end
end
