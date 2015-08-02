class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validate_login_field = false
    #c.login_field = :email
    #c.validate_password_field = false
  end

  has_many :messages, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :conversation, :foreign_key => :sender_id
  
end
