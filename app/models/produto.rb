class Produto < ApplicationRecord
  has_and_belongs_to_many :order
  has_many :order_items

  mount_uploader :image, AttachmentUploader
end
