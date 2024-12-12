# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  comments_count         :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  likes_count            :integer
#  private                :boolean
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many(:photos, class_name: "Photo", foreign_key: "owner_id")
  has_many(:comments, class_name: "Comment", foreign_key: "author_id")
  has_many(:likes, class_name: "Like", foreign_key: "fan_id")
  has_many(:sent_follow_requests, class_name: "FollowRequest", foreign_key: "sender_id", dependent: :destroy)
  has_many(:received_follow_requests, class_name: "FollowRequest", foreign_key: "recipient_id", dependent: :destroy)
  has_many(:liked_photos, through: :likes, source: :photo)
  has_many(:following, through: :sent_follow_requests, source: :recipient)
end
