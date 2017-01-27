# frozen_string_literal: true
require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  include ActionDispatch::TestProcess

  test "should create image" do
    file = fixture_file_upload("files/logo.png", "image/png")

    assert_difference("Image.count") do
      post images_url(format: :js), params: { image: { image: file } }
    end
  end
end
