class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end
  def new
    @job = Job.new
    gon.push({ :zip_codes => ZIP_CODES, :city_names => CITY_NAMES, :cities => CITIES })
  end
  def create
    @job = Job.create post_params
  end
  def edit
  end
  def update
  end
  def show
  end
  def destroy
  end
  private

    def post_params
      params.require(:job).permit(:id, :state, :total_time, :total_labor, :total_parts, :tax, :total_cost, :notes)
    end
end
