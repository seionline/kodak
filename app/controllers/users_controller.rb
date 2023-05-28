# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save && @user.start_email_confirmation
      redirect_to :home,
                  notice: I18n.t('auth.users.create.success_notice')
    else
      flash[:error] = t('auth.users.create.failure_alert')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :email_confirmation, :password,
                                 :password_confirmation)
  end
end
