# encoding: utf-8
# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.md5}"
  end
end
