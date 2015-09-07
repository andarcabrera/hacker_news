class User < ActiveRecord::Base
  before_save { self.username = username.downcase }

  has_many :posts, :foreign_key => :author_id
  has_many :comments, :foreign_key => :commenter_id

  has_secure_password

  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true, :length => { minimum: 3 }

end
