class TasksController < ApplicationController
  before_filter :save_return_to, only: [:take, :finish, :rollback, :checked]

  def index
    redirect_to project_tasks_path(Task.last.project) and return unless params[:project_id]
    @project = Project.find_by_identifier(params[:project_id])
    go_to_404 and return unless @project
    @tasks = @project.tasks
  end

  def take
    @task = Task.find(params[:task_id])
    @task.update_attributes(assignee: current_user)
    redirect_to session.delete(:return_to)
  end

  def finish
    @task = Task.find(params[:task_id])
    @task.update_attributes(status: :toreview, assignee: current_user)
    redirect_to session.delete(:return_to)
  end

  def rollback
    @task = Task.find(params[:task_id])
    @task.update_attributes(status: :todo, assignee: nil, creater: current_user)
    redirect_to session.delete(:return_to)
  end

  def checked
    @task = Task.find(params[:task_id])
    @task.update_attributes(status: :done, checker: current_user)
    redirect_to session.delete(:return_to)
  end
end
