require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "/recipes/new" do
    it "succeeds" do
      get new_recipe_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "/recipes/create" do
    def create_recipe(name, body)
      post recipes_path, params: {
        recipe: {
          name: name,
          body: body
        }
      }
    end

    context "valid params" do
      it "successfully creates a recipe" do
        expect do
          create_recipe("ex name", "ex body")
        end.to change { Recipe.count }.from(0).to(1)
        expect(response).to have_http_status(:redirect)
      end
    end

    context "invalid params" do
      it "fails at creating the recipe" do
        expect do
          create_recipe("", "")
        end.not_to change {Recipe.count}

        expect(Recipe.count).to eq(0)
        expect(response).to have_http_status(:success)
      end
    end
  end

  # ActiveRecord::RecordInvalid: => let(:recipe) { create(:recipe) }
  # Validation failed: Recipe must exist
  # describe "/recipes/:id for show" do
  #   let(:recipe) { create(:recipe) }
    
    # context "when passing in valid recipe id" do
    #   it "successeds" do
    #     get recipe_path(recipe)
    #     expect(response).to have_http_status(:success)
    #   end
    # end

    # context "when passing in invalid recipe id" do
    #   it "fails" do
    #     expect { get recipe_path("qwer")}.to raise_error(ActiveRecord::RecordNotFound)
    #   end
    # end
  # end

  # describe "edit recipe" do
  #   let(:recipe) { create(:recipe) }

  #   it "succeeds" do
  #     get edit_recipe_path(recipe)
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "update recipe" do
  #   let(:recipe) { create(:recipe) }

  #   context "when it is valid update" do
  #     it "updates" do
  #       old_name = recipe.name
  #       new_name = "new name"

  #       expect do
  #         put recipe_path(recipe), params: {
  #           recipe: {
  #             name: new_name
  #           }
  #         }
  #       end.to change { recipe.reload.name }.from(old_name).to(new_name)
  #       expect(response).to have_http_status(:redirect)
  #     end
  #   end

  #   context "when it is invalid update" do
  #     it "fails to update" do
  #       expect do
  #       put recipe_path(recipe), params: {
  #         recipe: {
  #           name: ""
  #         }
  #       }
  #       end.not_to change { recipe.reload.name }
  #       expect(response).to have_http_status(:success)
  #     end
  #   end
  # end

  # describe "delete recipe" do
  #   let(:recipe) { create(:recipe) }

  #   it "successfully deletes the recipe" do      
  #     recipe.save
  #     expect do
  #       delete recipe_path(recipe)
  #     end.to change { Recipe.count }.from(1).to(0)

  #     expect(response).to have_http_status(:redirect)
  #   end
  # end
end
