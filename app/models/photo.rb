# == Schema Information
#
# Table name: photos
#
#  id             :bigint           not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :bigint
#
# Indexes
#
#  index_photos_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Photo < ApplicationRecord
  belongs_to(:owner, class_name: "User", foreign_key: "owner_id")
  has_many(:comments, class_name: "Comment", foreign_key: "author_id", dependent: :destroy)
  has_many(:likes, class_name: "Like", foreign_key: "photo_id",dependent: :destroy)
  has_many(:fans, through: :likes, source: :fan)


end
