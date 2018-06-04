class Article < ApplicationRecord
	belongs_to :user
	has_many :comments,as: :cm_duty
end
