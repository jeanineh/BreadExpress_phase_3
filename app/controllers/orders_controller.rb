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
  	#@orders = Order.for_customer(@customer.id).paginate(page: params[:page]).per_page(10)
  end

  def create
  	@order = Order.new(order_params)
  	if @order.save
  		redirect_to @order, notice: "Order was added to the system."
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
    redirect_to orders_url
  end

  private
   # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:date, :grand_total)
    end
end
