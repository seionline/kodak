# frozen_string_literal: true

class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end
end
