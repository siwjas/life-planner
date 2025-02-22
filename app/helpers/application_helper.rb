module ApplicationHelper
  def nav_items
    [
      { page: "Home",     href: home_path },
      { page: "Tarefas",  href: tasks_path },
      { page: "Sobre",    href: about_path }
  ]
  end

  def nav_class(path)
    if current_page?(path)
      "shadow py-3 px-5 inline-flex items-center bg-emerald-400 dark:bg-gray-800 text-gray-100
      hover:shadow-md text-sm rounded-lg font-medium transition duration-300 ease-in-out"
    else
      "shadow py-3 px-5 inline-flex items-center bg-gray-100 hover:bg-emerald-400 dark:bg-transparent dark:hover:bg-gray-800
      hover:text-white hover:shadow-md text-sm rounded-lg font-medium transition duration-300 ease-in-out"
    end
  end

  def nav_class_mobile(path)
    if current_page?(path)
      "block rounded-md bg-emerald-400 px-3 py-3 text-base font-medium text-gray-800"
    else
      "block rounded-md px-3 py-3 text-base font-medium text-gray-800 hover:bg-gray-600 hover:text-gray-100
       dark:text-gray-300 dark:hover:text-gray-100 transition duration-300 ease-in-out"
    end
  end

  def aria(path)
    if current_page?(path)
      "page"
    else
      "false"
    end
  end
end
