# frozen_string_literal: true

class JobsController < ApplicationController
  load_and_authorize_resource
  before_action :set_job, only: %i[show update destroy]

  # GET /jobs
  def index
    @jobs = Job.where(nil)
    @jobs = @jobs.filter_by_title(params[:title]) if params[:title].present?
    if params[:created_at].present?
      @jobs = @jobs.filter_by_creation_date(params[:created_at])
    end
    json_response(@jobs)
  end

  # POST /jobs
  def create
    @job = Job.create!(job_params)
    json_response(@job, :created)
  end

  # GET /jobs/:id
  def show
    json_response(@job)
  end

  # PUT /jobs/:id
  def update
    @job.update(job_params)
    head :no_content
  end

  # DELETE /jobs/:id
  def destroy
    @job.destroy
    head :no_content
  end

  private

  def job_params
    # whitelist params
    params.permit(:title, :description)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
