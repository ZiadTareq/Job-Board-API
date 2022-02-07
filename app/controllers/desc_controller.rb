# frozen_string_literal: true

class DescController < ApplicationController
  # GET /job/desc?q=....
  def index
    response = Job.search params[:q]
    json_response(response)
  end
end
