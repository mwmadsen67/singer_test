# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string           not null
#  session_token   :string           not null
#
class User < ApplicationRecord
   # singular naming convention for Models
   # no need to require other files(Rails magic)

   validates :username, :session_token, presence: true, uniqueness: true
   #          ^name of the column that has special constraints
   validates :password_digest, presence: true
   validates :password, length: { minimum: 6, allow_nil: true }

   # before_validation :ensure_session_token # when you run .save on the instance
   after_initialize :ensure_session_token # after initializing (.new)

   has_many :songs, #method name
      primary_key: :id, 
      foreign_key: :author_id,
      class_name: :Song

   has_many :likes, 
      primary_key: :id, 
      foreign_key: :liker_id, 
      class_name: :Like

   has_many :liked_songs, 
      through: :likes, 
      source: :song

# pseudo-code
#    steps to login
#    user submits username and password
#    check if that user exists with that username
#    check if the password matches
#    use password_digest
#    IF PASSWORD MATCHES
#    set their session token and sesssion's session token to be equal
#    session[:session_token] = user.session_token (this is not perfect one though!)

   def self.find_by_credentials(username, password)
      user = User.find_by(username: username)
      if user && user.is_password?(password)
         user
      else
         nil
      end
   end

   def password=(password)
      self.password_digest = BCrypt::Password.create(password)
      @password = password 
   end

   def password 
      @password
   end

   def ensure_session_token
      self.session_token ||= SecureRandom::urlsafe_base64
   end

   def is_password?(password)
      password_object = BCrypt::Password.new(self.password_digest)
      password_object.is_password?(password)
   end

   def reset_session_token
      self.session_token = SecureRandom::urlsafe_base64
      self.save!
      self.session_token
   end
end
