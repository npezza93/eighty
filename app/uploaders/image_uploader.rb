# encoding: utf-8
# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave unless Rails.env.test?
end
