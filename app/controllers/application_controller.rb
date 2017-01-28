# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def notes
    if params[:search].blank?
      Note.all
    else
      Note.where("content LIKE ?", "%#{params[:search]}%")
    end.order(updated_at: :desc)
  end
  helper_method :notes
end
