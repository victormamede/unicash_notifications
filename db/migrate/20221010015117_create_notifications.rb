# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :message
      t.boolean :read
      t.json :data
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
