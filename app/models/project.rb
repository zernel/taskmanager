class Project < ActiveRecord::Base
  attr_accessible :overview, :identifier, :name, :status
  has_many :tasks

  STATUS = [:active, :inactive, :archived]
  as_enum :status, STATUS, :column => "status_cd"

  STATUS.each do |status|
    scope status, where(status_cd: statuses(status))
  end

  validates :identifier, uniqueness: true, presence: true

  def to_param
    identifier
  end
end
