class TasksController < ApplicationController
  inherit_resources
  actions :destroy, :new, :create

  def index
    redirect_to project_tasks_path(Task.last.project) and return unless params[:project_id]
    @project = Project.find_by_identifier(params[:project_id])
    go_to_404 and return unless @project
    @tasks = @project.tasks
  end

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    destroy! { project_tasks_path(@task.project) }
  end
end
