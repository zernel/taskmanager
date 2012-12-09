class TasksController < ApplicationController
  def index
    project = Project.find_by_identifier(params[:project_id])
    go_to_404 and return unless project
    @tasks = project.tasks
  end
end
