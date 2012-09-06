class Client < ActiveRecord::Base
  attr_accessible :email, :name, :department

  validates_presence_of :email
  validates_presence_of :name

  has_many :issues
end
