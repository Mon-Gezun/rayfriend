class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :connections

  has_many :friends, through: :connections

  def name
    "#{first_name} #{last_name}"
  end

  def friend?(user)
    friend_ids.include? user.id
  end

  def not_friend?(user)
    friend_ids.exclude? user.id
  end
end
