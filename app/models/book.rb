class Book < ApplicationRecord
	# Associations
  belongs_to :user, class_name: "User", foreign_key: :user_id
end