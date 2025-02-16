module TasksHelper
  def icon_by_status(status)
    if status == 'in_progress'
      'calendar-clock' 
    else
      'calendar-check-2'
    end
  end

  def detail_icon(status)
    if status == 'in_progress'
      'list-checks' 
    else
      'square-check'
    end
  end
end
