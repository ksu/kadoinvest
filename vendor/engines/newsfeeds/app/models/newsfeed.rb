class Newsfeed < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :text1, :text2]

  validates :title, :presence => true, :uniqueness => true
  
end
