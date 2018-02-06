class ProductsController < ApplicationController
  before_action :set_product, only: [ :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = []
    products = Product.where(deleted: false)
    products.each do |product|
      @products.push(product) unless Product.where(parent_id: product.id).any?
    end
  end
  def autocomplete
    @items = Product.autocomplete_by_description(params[:term])
    respond_to do |format|
      format.json
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @p = Product.where(:product_f => @product.product_f)
    @a = Product.find_by('product_f' => @product.product_f)
    # Product.find(:all)
    # Product.find(:id, :conditions => [ "id = :u", { :u => product.parent_id }])


  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path , notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :category_id,:new_category_name)
    end
end
