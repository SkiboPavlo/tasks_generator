require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before(:each){
    user = User.create!(email: "test@i.ua", password: "0987654321")
    sign_in user
  }
  describe "GET index" do
    it "assigns @tasks" do
      task = Task.create!(title: "test", content: "test")

      get :index
      expect(assigns(:tasks)).to eq([task])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    it "assigns @task" do
      get :new
      expect(assigns(:task).created_at).to eq(Task.new.created_at)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "GET edit" do
    it "assigns @task" do
      task = Task.create!(title: "test", content: "test")
      get :edit, id: 1
      expect(assigns(:task)).to eq(task)
    end

    it "renders edit template" do
      task = Task.create!(title: "test", content: "test")
      get :edit, id: 1
      expect(response).to render_template(:edit)
    end
  end

  describe "GET show" do
    it "assigns @task" do
      task = Task.create!(title: "test", content: "test")
      get :show, id: 1
      expect(assigns(:task)).to eq(task)
    end

    it "renders show template" do
      task = Task.create!(title: "test", content: "test")
      get :show, id: 1
      expect(response).to render_template(:show)
    end
  end

  describe "POST create" do
    it "success creates @task" do
      post :create, task: {title: "test", content: "test"}
      expect(response).to redirect_to(tasks_path)
    end

    it "failed creates @task" do
      post :create, task: {title: "test"}
      expect(response).to render_template(:new)
    end
  end

  describe "POST update" do
    it "success update @task" do
      task = Task.create!(title: "test", content: "test")
      post :update, id: 1, task: {title: "test_1", content: "test_1"}
      expect(response).to redirect_to(tasks_path)
    end

    it "failed updates @task" do
      task = Task.create!(title: "test", content: "test")
      post :update, id: 1, task: {title: ""}
      expect(response).to render_template(:edit)
    end
  end

  describe "POST destroy" do
    it "success destroy @task" do
      task = Task.create!(title: "test", content: "test")
      post :destroy, id: 1
      expect(response).to redirect_to(tasks_path)
    end
  end

end


