class Task < ApplicationRecord
  STATUSES = %w[in_progress complete archived].freeze
end
