module TasksHelper

  def label_task(task)
    if task.expired?
      content_tag(:span, 
        content_tag(:i, "", class: "fa-solid fa-circle-exclamation fa-lg"), 
        class: "text-rose-500 animate-pulse")
    else
      content_tag(:strong, "Deadline: ", class: "text-lg font-bold mb-1 text-gray-100")
    end
  end

end
