class Operation < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :part]

  validates :title, :presence => true, :uniqueness => true
  
end
