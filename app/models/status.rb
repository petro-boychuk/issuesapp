class Status < ActiveRecord::Base
  attr_accessible :kind, :title

  def self.initial_status
    Status.find_by_kind :waiting
  end

  def self.closed
    [Status.find_by_kind(:cancelled), Status.find_by_kind(:completed)]
  end


end
