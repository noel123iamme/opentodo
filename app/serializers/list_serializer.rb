class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :permission, :user, :items

  def name
  	object.name
  end

  def permission
  	object.permission
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end  
end
