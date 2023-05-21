# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  helper_method :current_user, :logged_in?

  private

  def set_locale
    params_locale = params[:locale] if I18n.available_locales.include?(params[:locale]&.to_sym)
    I18n.locale = session[:locale] = params_locale || session[:locale] || I18n.default_locale
  end

  def current_user
    User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    session[:current_user_id].present?
  end

  def allowed_order?(order)
    (order.user.present? && order.user == current_user) || session[:order_id] == order.id
  end
end
