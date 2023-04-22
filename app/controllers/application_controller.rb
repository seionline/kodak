# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  private

  def set_locale
    params_locale = params[:locale] if I18n.available_locales.include?(params[:locale]&.to_sym)
    I18n.locale = session[:locale] = params_locale || session[:locale] || I18n.default_locale
  end
end
