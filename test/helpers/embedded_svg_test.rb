# frozen_string_literal: true

require "test_helper"

class EmbeddedSvgTest < ActiveSupport::TestCase
  include ApplicationHelper
  include ActionView::Helpers

  test "returns html for embedding svg" do
    svg = embedded_svg("logo.svg")

    assert svg.is_a? String
    assert svg.include? "<?xml"
  end
end
