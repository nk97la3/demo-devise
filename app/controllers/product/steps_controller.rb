class Product::StepsController < ApplicationController
	include Wicked::Wizard
 	steps *Product.form_steps

  	def show
    	@product = Product.find params[:product_id]
    	render_wizard
  	end

  	def update
    	@product = Product.find params[:product_id]
    	@product.update_attributes product_params(step)
      if params[:Back] 
        @product.save
        redirect_to previous_wizard_path
      elsif params[:Save]
        @product.save
        render_wizard
      elsif params[:Publish]
        @product.published = "published"
        @product.save
        render_wizard @product
      else
        render_wizard @product
      end
      
  	end

  	private
  	def product_params step
  		permitted_attributes =  case step
                           	    when "step_one"
                             	    [:title,:opening,:user_id]
                           	    when "step_two"
                            	    [:image,:body]
                           	    when "step_three"
                             	    [:conclusion,:aboutauthor]
                           	  end
      params.require(:product).permit(permitted_attributes).merge(form_step: step)
  end
end
