class Status < ActiveRecord::Base
  attr_accessible :kind, :title

  def self.initial_status
    Status.find_by_kind :waiting
  end

end
