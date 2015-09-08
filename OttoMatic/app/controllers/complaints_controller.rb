class ComplaintsController < ApplicationController
  def index
    @complaints = Complaint.all
  end

  def new
    @complaint = Complaint.new
  end


  def create
    @complaint = Complaint.new post_params
    if @complaint.save
      flash[:notice] = "Complaint created successfully!"
    else
      flash[:notice] = "Sorry, something went wrong."
    end
    render html: render_to_string(partial: "form").html_safe
  end

  def edit
    @complaint = Complaint.find params[:id]
  end

  def update
    @complaint = Complaint.find params[:id]
    if @complaint.update_attributes post_params
      flash[:notice] = "Complaint updated with much success. Hooray!"
    else
      flash[:notice] = "Something's very wong here."
    end
    render html: render_to_string(partial: "form").html_safe
  end

  def destroy
  end

  def common_complaints
    @complaints = Complaint.all.where(appliance_kind: params[:appliance_type])
    if @complaints.empty?
      flash[:notice] = "There are no complaints associated with that appliance"
      logger.debug "//////NIL///////////#{@complaints.inspect}/////////////////////////////"
      render html: render_to_string(partial: "form").html_safe

    else
      flash[:notice] = "Complaints are not null"
      logger.debug "//////NOT NILL///////////#{@complaints.inspect}/////////////////////////////"
      render html: render_to_string(partial: "common_complaints").html_safe
    end
  end

  private

    def post_params
      params.require(:complaint).permit(:id, :complaint, :appliance_kind)
    end
end
