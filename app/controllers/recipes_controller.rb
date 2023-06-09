class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.method_steps.build
  end


  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end 
  end

  def show
    set_recipe
  end
  
  def edit
  end
  
  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  def search
    recipe = "%#{params[:recipe]}%"
    ingredient = "%#{params[:ingredient]}%"
    
    if params[:recipe].present? && params[:ingredient].present?
      @recipes = Recipe.joins(:ingredients).where("ingredients.name LIKE ?", ingredient).and(Recipe.where("recipes.name LIKE ?", recipe)).uniq
    elsif params[:recipe].present?
      @recipes = Recipe.where("recipes.name LIKE ?", recipe).uniq
    elsif params[:ingredient].present?
      @recipes = Recipe.joins(:ingredients).where("ingredients.name LIKE ?", ingredient).uniq
    else
      @recipes = Recipe.all.uniq
    end

    render :index
  end

  private
  def set_recipe
      @recipe = Recipe.find(params[:id])
  end

  def recipe_params
      params.require(:recipe).permit(
        :name,
        :body,
        ingredients_attributes: [
          :id,
          :name,
          :measure,
          :measure_type,
          :_destroy
        ],
        method_steps_attributes: [
          :id,
          :step,
          :_destroy
        ])
  end
end
