class Project < ActiveRecord::Base
  attr_accessible :overview, :identifier, :name, :project_status
  has_many :tasks

  STATUS = [:active, :inactive, :archived]
  as_enum :project_status, STATUS, :column => "status_cd"

  STATUS.each do |status|
    scope status, where(status_cd: Project.project_statuses(status))
  end

  def active?
    # status == :open && tasks.present?
  end

  def spent_time
    # tasks spent time sum
  end
end
