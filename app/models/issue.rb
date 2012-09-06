class Issue < ActiveRecord::Base
  attr_accessible :description, :client, :reference, :owner, :status, :subject

  belongs_to :client
  belongs_to :owner, :class_name => "Staff", :foreign_key => :owner_id
  belongs_to :status

  validates_presence_of :client
  validates_presence_of :subject
  validates_presence_of :description
  validates_presence_of :status

  before_save do
    if @new_record
      self.reference = generate_reference
    end
  end

  private

  def generate_reference
    "ABC-123456"
  end

end
