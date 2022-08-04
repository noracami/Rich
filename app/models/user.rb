class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  validates :password,
             presence: true,
             length: { minimum: 6 },
             confirmation: true
  # confirmation

  # callback
  before_create :encrypt_password

  def self.login(params)
    email, password = params.require(:user).values_at(:email, :password)
    salting = -> (txt) { "xx-------#{txt}--yy" }
    hashed_password = Digest::SHA1.hexdigest(salting.(password))
    find_by(email: email, password: hashed_password)
  end

  private

  def encrypt_password
    # require 'digest' # rails already loaded
    salting = -> (txt) {"xx-------#{txt}--yy"}
    self.password = Digest::SHA1.hexdigest(salting.(self.password))
  end
end