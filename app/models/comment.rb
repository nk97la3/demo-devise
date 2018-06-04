class Comment < ApplicationRecord
  belongs_to :cm_duty, polymorphic: true
  has_many :comments, as: :cm_duty
end
