class TasksController < ApplicationController
  def index
    redirect_to project_tasks_path(Task.last.project) and return unless params[:project_id]
    @project = Project.find_by_identifier(params[:project_id])
    go_to_404 and return unless @project
    @tasks = @project.tasks
  end
end
