class Attachment < ApplicationRecord
	has_attached_file :profile_picture, default_url: "/system/images/:style/missing.png"
	validates_attachment_content_type :profile_picture, content_type: /\Aimage\/.*\z/
end
