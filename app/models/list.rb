class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates_uniqueness_of :name, scope: :user_id
end
