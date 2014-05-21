class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :terms_of_service, :acceptance => true
  validates :email, format: { with: /([a-z\d._-]+)@([a-z\d._-]{2,}).([a-z\d._-]{3,})/i }

  def full_name
    "#{first_name} #{last_name}"
  end
end
