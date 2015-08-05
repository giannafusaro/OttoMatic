class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end
  def new
    @address = Address.new
  end
  def create
    @address = Address.new post_params
    if @address.save
      flash[:notice] = "Address saved successfully!"
    else
      flash[:notice] = "Something did not go right."
    end
    render html: render_to_string(partial: "addresses/form").html_safe
  end
  def edit
    @address = Address.find params[:id]
  end
  def update
    @address = Address.find params[:id]
    if @address.update_attributes post_params
      flash[:notice] = "Address updated successfully!"
    else
      flash[:notice] = "Something did not go right."
    end
    render html: render_to_string(partial: "addresses/form").html_safe
  end
  def show
    @address = Address.find params[:id]
  end
  def destroy
  end

  private

    def post_params
      params.require(:address).permit(:id, :street_1, :street_2, :city, :zipcode)
    end
end
