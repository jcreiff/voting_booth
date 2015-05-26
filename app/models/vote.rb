class Vote < ActiveRecord::Base

  belongs_to :candidate
  belongs_to :voter

  validates :voter_id, uniqueness: true

end
