class Project < ActiveRecord::Base
  attr_accessible :overview, :identifier, :name, :status
  as_enum :status, open: 1, close: 0

  def active
    # status == :open && tasks.present?
  end

  def spent_time
    # tasks spent time sum
  end
end
