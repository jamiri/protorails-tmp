# == Schema Information
#
# Table name: users
#
#  created_at   :datetime         not null
#  enable       :boolean
#  id           :integer          not null, primary key
#  mail_address :string(255)
#  name         :string(255)
#  password     :string(255)
#  updated_at   :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :mail_address, :password, :enable, :password_confirmation

  has_many :comments, :foreign_key => 'user_id'
  has_many :questions, :foreign_key => 'user_id'
  has_many :lesson_ratings, :foreign_key => 'user_id'
  has_many :feedbacks
  has_many :content_suggestions,:foreign_key => 'user_id'

  validates :password, :confirmation => :true

  public

  def enable?
    enable
  end


  before_save :encrypt_password

  def self.authenticate(email, submitted_password)
    user = find_by_mail_address(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def has_password?(submitted_password)
    password == encrypt(submitted_password)
  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.password = encrypt(password)
  end
  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end
  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

end
