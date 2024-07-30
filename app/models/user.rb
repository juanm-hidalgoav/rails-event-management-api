class User < ApplicationRecord
  has_secure_password

  has_many :events, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.from_token_request(request)
    email = request.params[:auth] && request.params[:auth][:email]
    find_by(email: email)
  end
end
