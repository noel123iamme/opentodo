class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :created_at #, :lists
  
  def name
  	object.name
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
