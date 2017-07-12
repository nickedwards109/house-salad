class SearchController < ApplicationController
  def index
    @representatives = Representative.find_by_state(params[:state])
    flash[:success] = "#{@representatives.count} Results"
  end
end
