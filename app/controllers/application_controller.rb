class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery except: :get_meals

  def get_meals
    @meals = Meal.all
    respond_to do |format|
      format.js { render json: @meals, callback: params['callback'] }
      format.json { render json: @meals }
    end
  end
end
