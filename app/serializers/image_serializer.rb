class ImageSerializer
  include JSONAPI::Serializer
  
  set_type :image
  set_id :id
  attributes :image
end
