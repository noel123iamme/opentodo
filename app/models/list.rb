class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates_uniqueness_of :name, scope: :user_id
  validates :permission, inclusion: { in: ['private', 'viewable', 'open'], message: "%{permission} is not a valid permission." }
end
