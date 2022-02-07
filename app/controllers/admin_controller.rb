# frozen_string_literal: true

class AdminController < ApplicationController
  skip_before_action :authorize_request, only: :create
  # POST /makeAdmin
  def create
    oneAdmin = User.where(admin: [true]).count
    if params.key?(:email) && User.where('email = ?', params[:email]).exists?
      if oneAdmin == 0
        User.where('email = ?', params[:email]).update(admin: true)
        response = { message: 'you made ' + params[:email] + ' the Admin!' }
        json_response(response)
      else
        response = { message: 'Sorry there is another admin' }
        json_response(response)
      end
    else
      response = { message: 'Please enter email OR your email is don\'t exist' }
      json_response(response)
    end
  end

  private

  def user_params
    params.permit(
      :admin,
      :email
    )
  end
end
