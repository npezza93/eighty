# frozen_string_literal: true
module ApplicationHelper
  def embedded_svg(filename, options = {})
    assets = Rails.application.assets
    file = assets.find_asset(filename).source.force_encoding("UTF-8")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css "svg"
    svg["class"] = options[:class] if options[:class].present?
    raw doc
  end

  def active_note(note, params)
    return if params[:id].blank?

    "active" if note.id == params[:id].to_i
  end
end
