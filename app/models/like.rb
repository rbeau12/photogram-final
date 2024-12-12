# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :bigint
#  photo_id   :bigint
#
# Indexes
#
#  index_likes_on_fan_id    (fan_id)
#  index_likes_on_photo_id  (photo_id)
#
# Foreign Keys
#
#  fk_rails_...  (fan_id => users.id)
#
class Like < ApplicationRecord
  belongs_to(:fan, class_name: "User", foreign_key: "fan_id")
  belongs_to(:photo, class_name: "Photo", foreign_key: "photo_id")
end
