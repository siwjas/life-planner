class Task < ApplicationRecord
  validates :name, :description, presence: true
  
  STATUSES = %w[in_progress complete archived].freeze

  def completed?
    status == 'completed'
  end
end
