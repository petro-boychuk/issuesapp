class History < ActiveRecord::Base
  attr_accessible :issue, :new_owner, :new_status, :old_owner, :old_status, :reply, :staff

  belongs_to :issue
  belongs_to :staff

  belongs_to :old_owner, :class_name => "Staff"
  belongs_to :new_owner, :class_name => "Staff"

  belongs_to :old_status, :class_name => "Status"
  belongs_to :new_status, :class_name => "Status"

  validates_presence_of :reply

  def owner_changed?
    old_owner != new_owner
  end

  def status_changed?
    new_status != old_status
  end

  def apply_to!(issue, status, owner, changed_by)
    self.old_status = issue.status
    self.new_status = status
    issue.status = status

    self.old_owner = issue.owner
    self.new_owner = owner
    issue.owner = owner

    self.issue = issue
    self.staff = changed_by

    transaction do
      issue.save
      self.save
    end

    IssueMailer.new_reply(self).deliver

    #TODO: Send email to the client about this update

  end



end
