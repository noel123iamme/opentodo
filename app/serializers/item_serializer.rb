class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :list

  def name
  	object.name
  end

  def body
  	object.body
  end
end
