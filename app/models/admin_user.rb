class AdminUser < ApplicationRecord
  validates :password, length: { in: 6..20 }
  has_secure_password

end
