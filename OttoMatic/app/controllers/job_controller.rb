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
end
