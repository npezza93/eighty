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

require "test_helper"

class ImageTest < ActiveSupport::TestCase
  test "md5 gets set before validation" do
    logo_path = ActionController::TestCase.fixture_path + "files/logo.png"

    image = Image.new(image: File.new(logo_path))
    assert image.valid?
    assert image.md5.present?
  end
end
