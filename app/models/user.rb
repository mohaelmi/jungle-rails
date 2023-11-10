class User < ApplicationRecord
  has_secure_password
  
 
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :password, presence: true
  validates :password, presence: { on: create }, length: { minimum: 8 }, :if => :password_digest_changed?

  
  def self.authenticate_with_credentials(emailAddress, password)
    
    # lowercase_email = downcase_email(emailAddress)
    emailAddress = emailAddress.strip
    # user = User.find_by_email(emailAddress.downcase)
    user = User.where("lower(email) = ?", emailAddress.downcase).first
    if(user)
      if(user.authenticate(password))
        return user
      else
        nil
      end
    else 
      nil 
    end
    
  end
  
  # def self.downcase_email email
  #   email.downcase
  # end





end
