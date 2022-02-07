# frozen_string_literal: true

class ApplicationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_job
  before_action :set_job_application, only: %i[show update destroy]

  # GET /jobs/:job_id/applications
  def index
    json_response(@job.applications)
  end

  # GET /jobs/:job_id/applications/:id
  def show
    if current_user.admin?
      if @application.seen == false
        params[:seen] = true
        @application.update(application_params)
        UserMailer.seen_application(@application.applicant).deliver_later
      end
    end
    json_response(@application)
  end

  # POST /jobs/:job_id/applications
  def create
    params[:applicant] = current_user.email
    params[:seen] = false
    @job.applications.create!(application_params)
    json_response(@job, :created)
  end

  # PUT /jobs/:job_id/applications/:id
  def update
    @application.update(application_params)
    head :no_content
  end

  # DELETE /jobs/:job_id/applications/:id
  def destroy
    @application.destroy
    head :no_content
  end

  private

  def application_params
    params.permit(:applicant, :seen)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  def set_job_application
    @application = @job.applications.find_by!(id: params[:id]) if @job
  end
end
