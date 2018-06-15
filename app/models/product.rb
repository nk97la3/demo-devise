class Product < ApplicationRecord
    mount_uploader :image, ImageUploader

    belongs_to :user
    has_many :comments,as: :cm_duty

  
    cattr_accessor :form_steps do
    	%w(step_one step_two step_three)
  	end
  
    attr_accessor :form_step

  	validates :title, presence: true, if: -> { required_for_step?(:step_one) }
  	validates :opening, presence: true, if: -> { required_for_step?(:step_one) }
  	validates :body, presence: true, if: -> { required_for_step?(:step_two) }
  	validates :conclusion, presence: true, if: -> { required_for_step?(:step_three) }
  	validates :aboutauthor, presence: true, if: -> { required_for_step?(:step_three) }

  	def required_for_step? step
    	return true if self.form_steps.index(step.to_s) == self.form_steps.index(form_step)
  	end
end
