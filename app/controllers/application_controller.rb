# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  def notes
    if params[:search].blank?
      current_user.notes
    else
      current_user.notes.where("content LIKE ?", "%#{params[:search]}%")
    end.order(updated_at: :desc)
  end
  helper_method :notes
end
