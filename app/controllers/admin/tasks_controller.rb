class Admin::TasksController < Admin::ApplicationController
  def create
    create! do |format|
      unless @task.errors.empty? # failure
        format.html { render action: "new" }
      else
        format.html { redirect_to project_tasks_path(@task.project) }
      end
    end
  end

  def update
    update! do |format|
      unless @task.errors.empty? # failure
        format.html { render action: "edit" }
      else
        format.html { redirect_to project_tasks_path(@task.project) }
      end
    end
  end

  def destroy
    destroy! { project_tasks_path(@task.project) }
  end
end
