class Project < ActiveRecord::Base
  attr_accessible :overview, :identifier, :name, :project_status
  has_many :tasks

  as_enum :project_status, [:active, :inactive, :archived], :column => "status_cd"

  def active
    # status == :open && tasks.present?
  end

  def spent_time
    # tasks spent time sum
  end
end
