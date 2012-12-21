class Project < ActiveRecord::Base
  attr_accessible :overview, :identifier, :name, :status
  has_many :tasks

  STATUS = [:active, :inactive, :archived]
  as_enum :status, STATUS, :column => "status_cd"

  STATUS.each do |status|
    scope status, where(status_cd: statuses(status))
  end

  validates :name, presence: true
  validates :identifier, uniqueness: true, presence: true

  def to_param
    identifier
  end

  def check_status
    if active?
      update_attributes(status: :inactive) unless tasks.active.present?
    else
      update_attributes(status: :active) if tasks.active.present?
    end
  end
end
