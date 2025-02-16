module ApplicationHelper
  def nav_items
    [
      { page: 'Home',     href: home_path },
      { page: 'Tarefas',  href: tasks_path },
      { page: 'Sobre',    href: about_path },
  ]
  end

  def nav_class(path)
    if current_page?(path)
      "shadow py-2 px-5 inline-flex items-center bg-emerald-400 text-white hover:shadow-md 
       text-sm rounded-lg font-medium transition duration-200 ease-in-out"
    else
      "shadow py-2 px-5 inline-flex items-center bg-gray-100 hover:bg-emerald-400 hover:text-white hover:shadow-md 
       text-sm rounded-lg font-medium transition duration-200 ease-in-out"
    end
  end

  def aria(path)
    if current_page?(path)
      'page' 
    else
      'false'
    end
  end

end
