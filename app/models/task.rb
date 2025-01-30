require 'dotiw'
include ActionView::Helpers::DateHelper
include ActionView::Helpers::TextHelper
include ActionView::Helpers::NumberHelper

class Task < ApplicationRecord
  validates :name, :description, presence: true
  
  STATUSES = %w[in_progress completed archived].freeze

  def formated_deadline
    case deadline
    when 'No deadline.', 'Today'  then 'text-gray-300'
    when 'Expired'                then 'text-rose-500 animate-pulse'
    else 'text-gray-300'
    end
  end

  def completed?
    status == 'completed'
  end

  def deadline    
    return 'No deadline.' if expiration_date.nil?

    if expiration_date == Date.today 
      'Today'
    else
      expiration_date.past? ? 'Expired!' : distance_of_time_in_words(Date.today, expiration_date)
    end
  end

  def expired?
    !expiration_date.nil? && expiration_date != Date.today && expiration_date.past?
  end
end
