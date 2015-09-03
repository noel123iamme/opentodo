class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :user, :items

  def name
  	object.name
  end
end
