require "dotiw"
include ActionView::Helpers::DateHelper

class Task < ApplicationRecord
  validates :name, :description, presence: true
  belongs_to :user

  STATUSES = %w[in_progress completed archived].freeze

  def in_progress?
    status == "in_progress"
  end

  def completed?
    status == "completed"
  end

  def archived?
    status == "archived"
  end

  def deadline
    return "No deadline" if expiration_date.nil?

    if expiration_date == Date.today
      "Today"
    else
      expired? ? "Expired" : "In progress"
    end
  end

  def expired?
    !expiration_date.nil? && expiration_date != Date.today && expiration_date.past?
  end
end
