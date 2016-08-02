class RestaurantsController < ApplicationController
	before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

	def index
		@restaurants = Restaurant.all
	end

	def show
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		#Create new Restaurant
		# @restaurant = Restaurant.new(name: params[:name], address:....)
		# @restaurant = Restaurant.new(params[:restaurant])

		@restaurant = Restaurant.new(restaurant_params)
		@restaurant.save

		# This is the Rails way
		redirect_to restaurant_path(@restaurant)
		# By not defining the redirect_to we need a create.html.erb
	end

	def edit
	end

	def update
		@restaurant.update(restaurant_params)

		redirect_to restaurant_path(@restaurant)
	end

	def destroy
		@restaurant.destroy

		redirect_to restaurants_path
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :address, :stars)
	end

	def set_restaurant
		@restaurant = Restaurant.find(params[:id])
	end
end
