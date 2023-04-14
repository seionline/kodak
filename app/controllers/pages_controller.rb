# frozen_string_literal: true

class PagesController < ApplicationController
  def index; end

  def faqs
    @email = 'info@kodak.sk'
  end
end
