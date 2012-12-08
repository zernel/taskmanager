class Task < ActiveRecord::Base
  attr_accessible :subject, :description, :priority, :project_id, :status, :type
  belongs_to :project

  as_enum :type, [:feature, :bug, :research]
  as_enum :priority, [:regular, :high]
  as_enum :status, [:todo, :toreview, :done]
end
