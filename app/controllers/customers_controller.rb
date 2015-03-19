class CustomersController < ApplicationController
  # A callback to set up an @owner object to work with 
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index 
     @customers = Customer.active.alphabetical.paginate(:page => params[:page]).per_page(10)
  end

  def create 
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer, notice: "#{@customer.name} was added to the system."
    else
      render action: 'new'
    end
  end

  def new
    @customer = Customer.new
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: "#{@customer.name} was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @customer = Customer.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :phone, :email, :active)
    end
end

