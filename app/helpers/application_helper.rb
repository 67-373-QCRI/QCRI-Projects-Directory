module ApplicationHelper

  def nav_is_active(controller)
    params[:controller] == controller ? "nav-link active" : "nav-link"
  end

  def indicate_current(controller)
    params[:controller] == controller ? "aria-current=\"page\"" : nil
  end

  def indicate_list_type(view)
    params[:view] == view ? "btn btn-outline-primary active" : "btn btn-outline-primary"
  end

  def link_to_add_authors(name)
    link_to name, '#', class: "add_author_fields", :"data-field" => "<input class='text optional' type='text'  name='publication[authors][]' id='publication_'>"
  end

end
