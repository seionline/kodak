# frozen_string_literal: true

class UserSessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:user_session][:email])

    if user&.authenticate(params[:user_session][:password])
      session[:current_user_id] = user.id
      redirect_to :home
    else
      @error = true
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to :home
  end
end
