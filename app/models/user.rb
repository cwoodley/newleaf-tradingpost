# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  friend_code     :string(255)
#  console_user    :string(255)
#  fruit           :string(255)
#  notes           :text(255)
#  avatar          :string(255)
#  twitter         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :avatar, :console_user, :email, :friend_code, :fruit, :notes, :twitter, :username, :password, :password_confirmation
  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  validates :friend_code, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  before_save { |user| user.email = email.downcase }
  before_save { |user| user.username = username.downcase }
end
