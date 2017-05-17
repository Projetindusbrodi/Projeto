class Produto < ApplicationRecord
  has_and_belongs_to_many :order
  has_many :shopping_cart_items
  belongs_to :department
  mount_uploader :image, AttachmentUploader
end
