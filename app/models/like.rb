# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  liker_id   :integer          not null
#  song_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
   belongs_to :song,
      primary_key: :id,
      foreign_key: :song_id,
      class_name: :Song


   belongs_to :liker, 
      primary_key: :id, 
      foreign_key: :liker_id, 
      class_name: :User
end
