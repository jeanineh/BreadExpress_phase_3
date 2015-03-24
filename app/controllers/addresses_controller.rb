class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def index
    @addresses = Address.by_customer.paginate(page: params[:page]).per_page(10)
  	@active_addresses = Address.active.by_customer.paginate(page: params[:page]).per_page(10)
  	@inactive_addresses = Address.inactive.by_customer.paginate(page: params[:page]).per_page(10)
  end

  def new
  	@address = Address.new
  end

  def show
  end

  def create
  	@address = Address.new(address_params)
  	if @address.save
  	  redirect_to @address, notice: "Address was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @address.update(address_params)
      redirect_to @address, notice: "Address was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_url, nocie: "Removed address from system."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:customer_id, :street_1, :street_2, :is_billing, :zip, :state, :recipient, :city, :active)
    end
end
