class TasksController < ApplicationController
  def index
    @tasks = Project.first.tasks
  end
end
