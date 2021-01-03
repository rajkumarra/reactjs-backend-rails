class OrdersController < ApplicationController
	include Rails.application.routes.url_helpers


	skip_before_action :verify_authenticity_token

	def create
		order = Order.new(recipe_name: params[:recipe_name], recipe_price: params[:recipe_price], recipe_quantity: params[:recipe_quantity],photo: params[:photo] )
        order.save

		respond_to do |format|
            format.json { render json: order }
    	end


	end


	def index
       @orders = Order.all
		respond_to do |format|
            format.json do
            	json = @orders.map do |order|
                  photo_url = order.photo.attached? ? 'http://localhost:3000' + rails_blob_path(order.photo) : nil

            	  order.attributes.merge!({photo_url: photo_url})
            	end

            	render(json: json) 
            end
    	end
	end


	def destroy
       @orders = Order.find(params[:id])
       @orders.destroy
      	

	end


	def edit


	end

	def update
       
        @orders = Order.find(params[:id])
		@orders.recipe_name = params[:recipe_name]
		@orders.recipe_price = params[:recipe_price]
		@orders.recipe_quantity = params[:recipe_quantity]
		@orders.photo = params[:photo]
		@orders.save      

	end



end
