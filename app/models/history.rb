class History < ActiveRecord::Base
  attr_accessible :issue, :new_owner, :new_status, :old_owner, :old_status, :reply, :staff

  belongs_to :issue
  belongs_to :staff

  belongs_to :old_owner, :class => "Staff"
  belongs_to :new_owner, :class => "Staff"

  belongs_to :old_status, :class => "Status"
  belongs_to :new_status, :class => "Status"

end
