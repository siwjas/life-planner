# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.date :expiration_date

      t.timestamps
    end
  end
end
