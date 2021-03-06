class MagazinesController < ApplicationController
  before_action :set_magazine, only: [:edit, :destroy]

  # GET /magazines
  # GET /magazines.json
  def index
    @magazines = Magazine.where(:cat_buy => '0')
  end

  def autocomplete
    @magazine = Magazine.autocomplete_by_description(params[:term])
    respond_to do |format|
      format.json
    end
  end

  # GET /magazines/1
  # GET /magazines/1.json
  def show

    @magazine = Magazine.find(params[:id])
    @last = Product.where('product_f' => @magazine.id).last
    @structures = ProductStructure.where(:product_id => @magazine.product_id)

  end

  # GET /magazines/new
  def new
    @magazine = Magazine.new
    @magazine.build_productshipment
  end

  # GET /magazines/1/edit
  def edit
    # @structurebuild = ProductStructure.where(:product_id => @magazine.product_id)


  end

  # POST /magazines
  # POST /magazines.json
  def create
    @magazine = Magazine.new(magazine_params)
    respond_to do |format|
      if @magazine.save
        format.html { redirect_to @magazine, notice: 'Magazine was successfully created.' }
        format.json { render :show, status: :created, location: @magazine }
      else
        format.html { render :new }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magazines/1
  # PATCH/PUT /magazines/1.json
  def update
    @magazine = Magazine.find(params[:id])
    respond_to do |format|
      if @magazine.update(magazine_params)
        format.html { redirect_to @magazine, notice: 'Magazine was successfully updated.' }
        format.json { render :show, status: :ok, location: @magazine }
      else
        format.html { render :edit }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magazines/1
  # DELETE /magazines/1.json
  def destroy
    @magazine.destroy
    respond_to do |format|
      format.html { redirect_to magazines_url, notice: 'Magazine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magazine
      @magazine = Magazine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magazine_params
      params.require(:magazine).permit(:productname, :price, :code, :price_sell, :cat_buy, :marza, :quantity, productshipment_attributes: [:id, :height, :weight, :width, :depth, :_destroy], product_structures_attributes: [:id, :label, :value, :_destroy])
    end
  def magazine_params_update
    # params.require(:magazine).permit(:productname,:quantity, product_structures_attributes: [:id, :label, :value, :_destroy]).merge(id: @magazine.product_id)
  end
end
