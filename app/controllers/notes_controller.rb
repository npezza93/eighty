# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_note, only: %i(show edit update destroy)

  def index
  end

  def show
  end

  def edit
  end

  def create
    @note = current_user.notes.create

    redirect_to edit_note_path(@note)
  end

  def update
    @note.update(note_params)

    respond_to do |format|
      format.html { redirect_to @note }
      format.js { render json: nil, status: :ok }
    end
  end

  def destroy
    @note.destroy

    redirect_to notes_url, notice: "Note was destroyed."
  end

  private

  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    { content: params[:value] || params.dig(:note, :content) }
  end
end
