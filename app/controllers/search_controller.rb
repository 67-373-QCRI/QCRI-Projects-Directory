class SearchController < ApplicationController
  def basic_search
    redirect_back(fallback_location: home_path) if params[:query].blank?

    # this is the query
    # params[:query] is passing the variable :search from my search bar.
    @query = params[:query]

    @projects= Project.search(@query)
    # counting the results obtained
    @total_hits =@projects.size

    # TO DO: Add search for products and researchers
  end
end
