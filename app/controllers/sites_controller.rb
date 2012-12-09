class SitesController < ApplicationController
  def index
    @tasks = Task.active
  end
end
