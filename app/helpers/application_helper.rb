module ApplicationHelper

  def nav_is_active(controller)
    params[:controller] == controller ? "nav-link active" : "nav-link"
  end

  def indicate_current(controller)
    params[:controller] == controller ? "aria-current=\"page\"" : nil
  end

end
