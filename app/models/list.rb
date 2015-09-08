class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  validates_uniqueness_of :name, scope: :user_id

  def private?
  	permission == 'private'
  end

  def public?
  	permission == 'public'
  end
end
