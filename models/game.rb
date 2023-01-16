class Game < ApplicationRecord
	mount_uploader :thumbnail, ThumbnailUploader
  	mount_uploader :gameplay, VideoUploader

  	ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'

	belongs_to :category
	has_many :comments, dependent: :destroy
	has_one :room, dependent: :destroy
	has_many :room_messages, dependent: :destroy, inverse_of: :game
end
