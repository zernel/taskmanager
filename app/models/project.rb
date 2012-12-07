class Project < ActiveRecord::Base
  attr_accessible :description, :identifier, :name, :status_cd
  as_enum :status, open: 1, close: 0
end
