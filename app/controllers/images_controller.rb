# frozen_string_literal: true

class ImagesController < ApplicationController
  def create
    @image = Image.create(image_params)
    @image = Image.find_by(md5: @image.md5) if @image.new_record?
  end

  private

  def image_params
    params.require(:image).permit(:image)
  end
end
