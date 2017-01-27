class Image < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :md5, uniqueness: true

  before_validation do
    self.md5 = Digest::MD5.hexdigest image.file.read.to_s
  end
end
