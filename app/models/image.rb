# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  image      :string
#  md5        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :md5, uniqueness: true

  before_validation do
    self.md5 = Digest::MD5.hexdigest image.file.read.to_s
  end
end
