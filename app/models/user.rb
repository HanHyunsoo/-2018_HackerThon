class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :categories
  has_many :active_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :following
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  belongs_to :autority
  
  has_one :seller_page
  has_many :unassign_requests, dependent: :destroy
  has_many :assign_request_comments, dependent: :destroy

  has_many :orders, dependent: :nullify
  
  has_many :goods, through: :carts
  has_many :carts, dependent: :destroy  
  
  
  def following?(other_user)
    active_relationships.find_by(following_id: other_user.id)
  end
  
  def follow!(other_user)
    active_relationships.create!(following_id: other_user.id)
  end
  
  def unfollow!(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end
  
  
end
