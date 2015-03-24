class OrdersController < ApplicationController

before_action :set_order, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def index
  	@orders = Order.chronological.paginate(:page => params[:page]).per_page(10)
  end

  def new
  	@order = Order.new
  end

  def show
  	@orders = Order.chronological.paginate(:page => params[:page]).per_page(10)
  end

  def create
    @order = Order.new(order_params)
    @order.date = Date.today
    if @order.save
      redirect_to @order, notice: "Thank you for ordering from Bread Express."
    else 
      render action: 'new'
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: "Order was deleted from the system."
  end

  private
   # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:date, :customer_id, :address_id, :grand_total)
    end
end
