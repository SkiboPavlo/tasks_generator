require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe "GET index" do
    it "assigns @tasks" do
      task = Task.create
      get :index
      expect(assigns(:task)).to eq([task])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end


