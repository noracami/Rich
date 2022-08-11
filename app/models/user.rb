class User < ApplicationRecord
  # relationships
  has_one :blog
  has_many :articles
  has_many :comments
  has_many :like_articles
  has_many :liked_articles,
           through: :like_articles,
           source: :article
  has_many :blog_visitors
  has_many :visited_blogs,
           through: :blog_visitors,
           source: :blog

  # validation
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

  def own?(article)
    article.user == self
  end

  def liked?(article)
    liked_articles.include?(article)
  end

  private

  def encrypt_password
    # require 'digest' # rails already loaded
    salting = -> (txt) {"xx-------#{txt}--yy"}
    self.password = Digest::SHA1.hexdigest(salting.(self.password))
  end
end
