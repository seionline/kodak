# frozen_string_literal: true

class PhotosController < ApplicationController
  def destroy
    photo = Photo.find(params[:id])
    if photo.orders.all? { |o| allowed_order?(o) }
      photo.destroy
      # TODO: add flash message
    else
      # TODO: add flash message
    end
    redirect_to photo.orders.first
  end
end
