class JobController < ApplicationController
  def index
    Job.all
  end
  def new
    @job = Job.new
  end
  def create

  end
  def edit
  end
  def show
  end
  def destroy
  end
  private

    def post_params
      params.require(:post).permit(:id, :title, :date, :author, :abstract, :content, :url_title, :img_url)
    end
end
