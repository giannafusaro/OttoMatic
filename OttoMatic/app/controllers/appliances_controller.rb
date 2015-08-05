class AppliancesController < ApplicationController
  def index
    @appliances = Appliance.all
  end
  def new
    @appliance = Appliance.new
  end
  def create
    @appliance = Appliance.new post_params
    if @appliance.save
      flash[:notice] = "Appliance created successfully!"
    else
      flash[:notice] = "Sorry, something went wrong."
    end

    render html: render_to_string(partial: "form").html_safe
  end
  def edit
    @appliance = Appliance.find params[:id]
  end
  def update
    @appliance = Appliance.find params[:id]
    if @appliance.update_attributes post_params
      flash[:notice] = "Appliance created successfully!"
    else
      flash[:notice] = "Sorry, something went wrong."
    end
    render html: render_to_string(partial: "form").html_safe
  end
  def destroy
  end
  private

    def post_params
      params.require(:appliance).permit(:id, :brand, :type, :model, :serial, :purchased_at)
    end
end
