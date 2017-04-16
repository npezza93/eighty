# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image
      t.string :md5, index: true

      t.timestamps
    end
  end
end
