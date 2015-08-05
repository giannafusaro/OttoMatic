class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new post_params
    if @trip.save
      flash[:notice] = "Trip created successfully."
    else
      flash[:notice] = "Something is not quite right."
    end
    render html: render_to_string(partial: "form").html_safe
  end

  def edit
    @trip = Trip.find params[:id]
  end

  def update
    @trip = Trip.find params[:id]
    if @trip.update_attributes post_params
      flash[:notice] = "Woohoo, trip updated with success!"
    else
      flash[:notice] = "No trip for you."
    end
    render html: render_to_string(partial: "form").html_safe
  end

  def destroy
  end

  private

    def post_params
      params.require(:trip).permit(:id, :technician_id, :job_id, :time, :notes, :description)

    end

end
