class Admin::TasksController < Admin::ApplicationController
  before_filter :save_return_to, only: [:edit, :new]

  def create
    create! do |format|
      unless @task.errors.empty? # failure
        format.html { render action: "new" }
      else
        format.html { redirect_to session.delete(:return_to) }
      end
    end
  end

  def update
    update! do |format|
      unless @task.errors.empty? # failure
        format.html { render action: "edit" }
      else
        format.html { redirect_to session.delete(:return_to) }
      end
    end
  end

  def destroy
    destroy! { project_tasks_path(@task.project) }
  end
end
