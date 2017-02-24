class Admin::MealsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(name: params[:meal][:name], description: params[:meal][:description],
                         price: params[:meal][:price], status: params[:meal][:status])
    if @meal.save
      flash[:notice] = "Meal successfully created"
      redirect_to admin_meal_path(@meal)
    else
      flash[:alert] = "Uh oh something went wrong!"
      redirect_to admin_meals_path
    end
  end

  def edit
    @meal = Meal.find params[:id]
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update!(meal_params)
      flash[:notice] = "Meal successfully updated"
      redirect_to edit_admin_meal_path(@meal)
    else
      render 'edit'
    end
  end

  def show
    @meal = Meal.find params[:id]
  end

  def destroy
    @meal = Meal.find params[:id]
    @meal.destroy!
    redirect_to admin_meals_path
  end

  def delete_image
    @meal = Meal.find params[:id]
    remaining_images = @meal.images
    @meal.images.delete_at(params[:image_id].to_i) # delete target image
    @meal.images = remaining_images
    @meal.save!
  end

  private

  def meal_params
    params.require(:meal).permit(:name, :description, :status, :price, :type, :image, :image_id, { images: [] })
  end
end
