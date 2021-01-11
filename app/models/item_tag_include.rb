class ItemTagInclude

  include ActiveModel::Model

  attr_accessor :tag_name, :tag_id, :item_id

  def save
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTag.create(item_id: item_id, tag_id: tag.id)
  end
end