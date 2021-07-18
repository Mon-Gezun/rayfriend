class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :connections
  has_many :friend_requests

  has_many :friends, through: :connections

  def name
    "#{first_name} #{last_name}"
  end

  def friend?(user)
    friend_ids.include? user.id
  end

  def friend_request(user)
    friend_requests.find_by(friend_id: user.id)
  end

  def connection(user)
    connections.find_by(friend_id: user.id)
  end

  def not_friend?(user)
    friend_ids.exclude? user.id
  end

  def friend_requestable?(user)
    id != user.id \
      && not_friend?(user) \
      && !pending_friend_request?(user)
  end

  def pending_friend_request?(user)
    friend_requests
      .where(friend_id: user.id)
      .where(accepted: false).any?
  end
end
