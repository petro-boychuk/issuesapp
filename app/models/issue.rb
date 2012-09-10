class Issue < ActiveRecord::Base
  attr_accessible :description, :client, :reference, :owner, :status, :subject

  belongs_to :client
  belongs_to :owner, :class_name => "Staff", :foreign_key => :owner_id
  belongs_to :status

  validates_presence_of :client
  validates_presence_of :subject
  validates_presence_of :description
  validates_presence_of :status

  scope :unassigned, where(:owner_id => nil)

  before_save do
    if @new_record
      self.reference = generate_reference
      self.access_hash = SecureRandom.hex(6)
    end
  end

  def history
    History.find_all_by_issue_id id
  end

  # Try to find issue by reference id
  def self.reference_search id
    Issue.where("reference LIKE ?", "%" + id.gsub('%', '\%').gsub('_', '\_') + "%").first
  end

  def self.term_search term
    term = "%" + term.gsub('%', '\%').gsub('_', '\_') + "%"
    Issue.where("description LIKE ? OR subject LIKE ?", term, term).all
  end

  def self.new_unassigned
    Issue.find_all_by_owner_id nil
  end

  def self.closed
    Issue.where("status_id IN (?)", Status.closed.map {|s| s.id})
  end

  def self.open
    Issue.where("status_id NOT IN (?)", Status.closed.map {|s| s.id})
  end

  def self.on_hold
    Issue.where(:status_id => Status.find_by_kind(:on_hold).id)
  end

  def self.filters
    [:new_unassigned, :closed, :open, :on_hold]
  end

  private

  def generate_reference
    issue = Issue.last
    id = "1"
    id = issue.id + 1 if issue
    result = "ABC-#{id.to_s.rjust(6, "0")}"
    result
  end

end
