class AddStatusesToTask < ActiveRecord::Migration[8.0]
  create_enum :task_status, %w[in_progress complete archived]

  def change
    add_column :tasks, :status, :enum, enum_type: :task_status, default: "in_progress", null: false
  end
end
