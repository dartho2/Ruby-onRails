class ProductStructuresController < ApplicationController
  before_action :set_product_structure, only: [:show, :edit, :update, :destroy]

  # GET /product_structures
  # GET /product_structures.json
  def index
    @product_structures = ProductStructure.all
  end

  # GET /product_structures/1
  # GET /product_structures/1.json
  def show
  end

  # GET /product_structures/new
  def new
    @product_structure = ProductStructure.new
  end

  # GET /product_structures/1/edit
  def edit
  end

  # POST /product_structures
  # POST /product_structures.json
  def create
    @product_structure = ProductStructure.new(product_structure_params)

    respond_to do |format|
      if @product_structure.save
        format.html { redirect_to @product_structure, notice: 'Product structure was successfully created.' }
        format.json { render :show, status: :created, location: @product_structure }
      else
        format.html { render :new }
        format.json { render json: @product_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_structures/1
  # PATCH/PUT /product_structures/1.json
  def update
    respond_to do |format|
      if @product_structure.update(product_structure_params)
        format.html { redirect_to @product_structure, notice: 'Product structure was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_structure }
      else
        format.html { render :edit }
        format.json { render json: @product_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_structures/1
  # DELETE /product_structures/1.json
  def destroy
    @product_structure.destroy
    respond_to do |format|
      format.html { redirect_to product_structures_url, notice: 'Product structure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_structure
      @product_structure = ProductStructure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_structure_params
      params.fetch(:product_structure, {})
    end
end
