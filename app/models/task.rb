class Task < ActiveRecord::Base
  attr_accessible :subject, :description, :priority, :project, :status, :type, :status_cd, :project_id
  belongs_to :project

  STATUS = [:todo, :toreview, :done]
  TYPE = [:feature, :bug, :research]
  PRIORITY = [:regular, :high]

  as_enum :status, STATUS
  as_enum :type, TYPE
  as_enum :priority, PRIORITY

  scope :active, where('status_cd IN (?)', [statuses(:todo), statuses(:toreview)])
  STATUS.each do |status|
    scope status, where(status_cd: statuses(status))
  end

  validates_presence_of :subject, :priority_cd, :project_id, :status_cd, :type_cd
end
