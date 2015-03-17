class CustomerController < ApplicationController
  # A callback to set up an @owner object to work with 
  before_action :set_owner, only: [:show, :edit, :update, :destroy]
  def show
  end

  def edit
  end

  def update
  end

  def destroy
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
