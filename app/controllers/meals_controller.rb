class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create
    puts params
    @meal = Meal.new(name: params[:meal][:name], description: params[:meal][:description], 
                         price: params[:meal][:price], status: params[:meal][:status])
    if @meal.save
      flash[:notice] = "Meal successfully created"
      redirect_to @meal
    else
      flash[:alert] = "Uh oh something went wrong!"
      redirect_to meals_path
    end
  end

  def show
    @meal = Meal.find params[:id]
  end

  def destroy
  end
end
