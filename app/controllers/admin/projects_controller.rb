class Admin::ProjectsController < Admin::ApplicationController

  protected
  def resource
    @project ||= end_of_association_chain.find_by_identifier!(params[:id])
  end
end
