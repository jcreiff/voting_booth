class Voter < ActiveRecord::Base

  has_one :vote

  validates :name, presence: true

end
