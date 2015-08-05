class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new post_params
    if @customer.save
      flash[:notice] = "Customer created successfully!"
    else
      flash[:notice] = "Sorry, something went wrong."
    end
    render html: render_to_string(partial: "form").html_safe
  end

  def edit
    @customer = Customer.find params[:id]
  end

  def update
    @customer = Customer.find params[:id]
    if @customer.update_attributes post_params
      flash[:notice] = "Customer updated with much success. Hooray!"
    else
      flash[:notice] = "Something's very wong here."
    end
    render html: render_to_string(partial: "form").html_safe
  end

  def destroy
  end

  private

    def post_params
      params.require(:customer).permit(:id, :first_name, :last_name, :primary_phone, :secondary_phone, :email, :notes)
    end
end
