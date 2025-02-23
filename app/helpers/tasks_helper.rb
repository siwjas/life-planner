module TasksHelper
  def icon_by_status(status)
    if status == "in_progress"
      "calendar-clock"
    else
      "calendar-check-2"
    end
  end



  def detail_icon(status)
    if status == "in_progress"
      "list-checks"
    else
      "square-check"
    end
  end

  def badge_style_by_status(deadline)
    [
      { "badge_greent": deadline == "In progress" },
      { "badge_defalt": deadline == "Today" },
      { "badge_red": deadline == "Expired" },
      { "badge_neutral": deadline == "No deadline" }
    ]

    # case deadline
    # when "Today"        then "badge_default"
    # when "Expired"      then "badge_red"
    # when "No deadline"  then "badge_neutral"
    # else "badge_green"
    # end
  end
end
