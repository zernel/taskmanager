class Task < ActiveRecord::Base
  attr_accessible :subject, :description, :priority, :project, :status, :type
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
end
