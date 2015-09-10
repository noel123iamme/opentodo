class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :list

  def name
  	object.name
  end

  def body
  	object.body
  end
 
  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
