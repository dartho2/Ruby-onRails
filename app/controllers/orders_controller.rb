class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def earning
    @orders = Order.order("sale_date desc")
    @orders_group = @orders.all.group_by { |m| m.sale_date.beginning_of_month }
  end

  def autocomplete
    @items = Product.autocomplete_by_description(params[:term])
    respond_to do |format|
      format.json
    end
  end

  def show
  end

  # GET /orders/new
  def order

  end

  def new
    @order = Order.new
    @order.build_client
    @order.client.build_adress

  end


  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    if @order.client.nil?
      @order.build_client
      @order.client.build_adress
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    # @products = ProductOrder.where(order_id: @order_id)
    respond_to do |format|
      if @order.save
        format.html {redirect_to @order, notice: 'Order was successfully created.'}
        format.json {render :show, status: :created, location: @order}
      else
        format.html {render :new}
        format.json {render json: @order.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html {redirect_to @order, notice: 'Order was successfully updated.'}
        format.json {render :show, status: :ok, location: @order}
      else
        format.html {render :edit}
        format.json {render json: @order.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html {redirect_to orders_url, notice: 'Order was successfully destroyed.'}
      format.json {head :no_content}
    end
  end



  def status
    @orders = Order.find(params[:id])
    @orders.update(status: params[:status])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order)
      .permit([:name, :datatime, :sale_date,
               client_attributes: [:id, :firstname, :_destroy,
                                   adress_attributes: [:id, :city, :zip, :street, :phone, :number, :company_zip, :company_city, :company_street, :company_number, :company_nip]]],
              product_orders_attributes: [:id, :quantity, :name, :price, :created_at, :_destroy,
                                          product_attributes: [:id, :price, :name, :quantity, :_destroy]])
  end

  def params_orderss
    params.require(:order)
      .permit(:id, :name, :price, :status)
  end
end
