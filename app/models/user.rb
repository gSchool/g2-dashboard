class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true
  validates :email, :uniqueness => true

  def full_name
    "#{first_name} #{last_name}"
  end
end
