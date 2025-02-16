require 'dotiw'
include ActionView::Helpers::DateHelper
#include ActionView::Helpers::TextHelper
#include ActionView::Helpers::NumberHelper

class Task < ApplicationRecord
  validates :name, :description, presence: true
  
  STATUSES = %w[in_progress completed archived].freeze

  def a_day
    expiration_date < Date.today ? 'Expirada' : 'No prazo'
  end

  def in_progress?
    status == 'in_progress'
  end

  def completed?
    status == 'completed'
  end

  def archived?
    status == 'archived'
  end

  def deadline    
    return 'No deadline' if expiration_date.nil?

    if expiration_date == Date.today
      'Today'
    else
      expired? ? 'Expired' : distance_of_time_in_words(Date.today, expiration_date)
    end
  end

  def expired?
    !expiration_date.nil? && expiration_date != Date.today && expiration_date.past?
  end
end
