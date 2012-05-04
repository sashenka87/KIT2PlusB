require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe QuestionairesController do

  # This should return the minimal set of attributes required to create a valid
  # Questionaire. As you add validations to Questionaire, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # QuestionairesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all questionaires as @questionaires" do
      questionaire = Questionaire.create! valid_attributes
      get :index, {}, valid_session
      assigns(:questionaires).should eq([questionaire])
    end
  end

  describe "GET show" do
    it "assigns the requested questionaire as @questionaire" do
      questionaire = Questionaire.create! valid_attributes
      get :show, {:id => questionaire.to_param}, valid_session
      assigns(:questionaire).should eq(questionaire)
    end
  end

  describe "GET new" do
    it "assigns a new questionaire as @questionaire" do
      get :new, {}, valid_session
      assigns(:questionaire).should be_a_new(Questionaire)
    end
  end

  # describe "GET edit" do
  #   it "assigns the requested questionaire as @questionaire" do
  #     questionaire = Questionaire.create! valid_attributes
  #     get :edit, {:id => questionaire.to_param}, valid_session
  #     assigns(:questionaire).should eq(questionaire)
  #   end
  # end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Questionaire" do
        expect {
          post :create, {:questionaire => valid_attributes}, valid_session
        }.to change(Questionaire, :count).by(1)
      end

      it "assigns a newly created questionaire as @questionaire" do
        post :create, {:questionaire => valid_attributes}, valid_session
        assigns(:questionaire).should be_a(Questionaire)
        assigns(:questionaire).should be_persisted
      end

      it "redirects to the created questionaire" do
        post :create, {:questionaire => valid_attributes}, valid_session
        response.should redirect_to(Questionaire.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved questionaire as @questionaire" do
        # Trigger the behavior that occurs when invalid params are submitted
        Questionaire.any_instance.stub(:save).and_return(false)
        post :create, {:questionaire => {}}, valid_session
        assigns(:questionaire).should be_a_new(Questionaire)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Questionaire.any_instance.stub(:save).and_return(false)
        post :create, {:questionaire => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested questionaire" do
        questionaire = Questionaire.create! valid_attributes
        # Assuming there are no other questionaires in the database, this
        # specifies that the Questionaire created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Questionaire.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => questionaire.to_param, :questionaire => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested questionaire as @questionaire" do
        questionaire = Questionaire.create! valid_attributes
        put :update, {:id => questionaire.to_param, :questionaire => valid_attributes}, valid_session
        assigns(:questionaire).should eq(questionaire)
      end

      it "redirects to the questionaire" do
        questionaire = Questionaire.create! valid_attributes
        put :update, {:id => questionaire.to_param, :questionaire => valid_attributes}, valid_session
        response.should redirect_to(questionaire)
      end
    end

    describe "with invalid params" do
      it "assigns the questionaire as @questionaire" do
        questionaire = Questionaire.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Questionaire.any_instance.stub(:save).and_return(false)
        put :update, {:id => questionaire.to_param, :questionaire => {}}, valid_session
        assigns(:questionaire).should eq(questionaire)
      end

      it "re-renders the 'edit' template" do
        questionaire = Questionaire.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Questionaire.any_instance.stub(:save).and_return(false)
        put :update, {:id => questionaire.to_param, :questionaire => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested questionaire" do
      questionaire = Questionaire.create! valid_attributes
      expect {
        delete :destroy, {:id => questionaire.to_param}, valid_session
      }.to change(Questionaire, :count).by(-1)
    end

    it "redirects to the questionaires list" do
      questionaire = Questionaire.create! valid_attributes
      delete :destroy, {:id => questionaire.to_param}, valid_session
      response.should redirect_to(questionaires_url)
    end
  end

end