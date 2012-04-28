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

describe SearchesController do
  render_views

  # This should return the minimal set of attributes required to create a valid
  # Search. As you add validations to Search, be sure to
  # update the return value of this method accordingly.
  def step0_attributes
    { :d_know_astro => 50, :d_know_psyc => 54, :t_know_astro => 73, :t_know_psyc => 92 }
  end
  
  def step1_attributes
    { :d_interest_astro => 23, :d_interest_psyc => 43, :t_interest_astro => 12, :t_interest_psyc => 85 }
  end
  
  def step2_attributes
    { :answer_discrete => "text" }
  end
  
  def step3_attributes
    { :confidence_discrete => 12, :confidencewhy_discrete => "blah" }
  end
  
  def step4_attributes
    { :answer_open => "blah" }
  end
  
  def step5_attributes
    { :confidence_open => 65, :confidencewhy_open => "bar" }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SearchesController. Be sure to keep this updated too.
  def valid_session
    { :session_id => "woot"}
  end
  
  def auth_admin
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV["ADMIN_USER"]}:#{ENV["ADMIN_PASS"]}")
  end
  
  before(:each) do
    @participant = FactoryGirl.create(:participant, :session_id => "woot")
    @demographic = FactoryGirl.create(:demographic, :participant_id => @participant.id)
    @graphic     = FactoryGirl.create(:graphic, :participant_id => @participant.id)
  end

  describe "GET index" do
    before(:each) do
      auth_admin
    end
    it "assigns all searches as @searches" do
      search = FactoryGirl.create(:search, :participant_id => @participant.id)
      get :index, {}, valid_session
      assigns(:searches).should eq([search])
    end
  end

  describe "GET show" do
    before(:each) do
      auth_admin
    end
    it "assigns the requested search as @search" do
      search = FactoryGirl.create(:search, :participant_id => @participant.id)
      get :show, {:id => search.to_param}, valid_session
      assigns(:search).should eq(search)
    end
  end

  describe "GET new" do
    it "assigns a new search as @search" do
      get :new, {}, valid_session
      assigns(:search).should_not be_a_new(Search)
    end
    
    it "should redirect to the new_demographic page" do
      @demographic.destroy
      @graphic.destroy
      get :new, {}, valid_session
      response.should redirect_to(new_demographic_path)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Search" do
        expect {
          post :create, {:search => step0_attributes}, valid_session
        }.to change(Search, :count).by(1)
      end

      it "assigns a newly created search as @search" do
        post :create, {:search => step0_attributes}, valid_session
        assigns(:search).should be_a(Search)
        assigns(:search).should be_persisted
      end

      it "redirects to the created search" do
        post :create, {:search => step0_attributes}, valid_session
        response.should redirect_to(new_search_path)
      end
      
      it "should have step = 1" do
        post :create, {:search => step0_attributes}, valid_session
        assigns(:search).step.should == 1
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved search as @search" do
        # Trigger the behavior that occurs when invalid params are submitted
        Search.any_instance.stub(:save).and_return(false)
        post :create, {:search => {}}, valid_session
        assigns(:search).should be_a_new(Search)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Search.any_instance.stub(:save).and_return(false)
        post :create, {:search => {}}, valid_session
        response.should render_template("searches/steps/step0")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested search" do
        search = FactoryGirl.create(:search, :participant_id => @participant.id)
        # Assuming there are no other searches in the database, this
        # specifies that the Search created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Search.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => search.to_param, :search => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested search as @search" do
        search = FactoryGirl.create(:search, :participant_id => @participant.id)
        put :update, {:id => search.to_param, :search => step1_attributes}, valid_session
        assigns(:search).should eq(search)
      end

      it "redirects to the search" do
        search = FactoryGirl.create(:search, :participant_id => @participant.id)
        put :update, {:id => search.to_param, :search => step1_attributes}, valid_session
        response.should redirect_to(new_search_path)
      end
      
      it "should increase the step number by one" do
        search = FactoryGirl.create(:search, :participant_id => @participant.id, :step => 2)
        put :update, {:id => search.to_param, :search => step1_attributes}, valid_session
        search.reload
        search.step.should == 3
      end
    end

    describe "with invalid params" do
      it "assigns the search as @search" do
        search = FactoryGirl.create(:search, :participant_id => @participant.id)
        # Trigger the behavior that occurs when invalid params are submitted
        Search.any_instance.stub(:save).and_return(false)
        put :update, {:id => search.to_param, :search => {}}, valid_session
        assigns(:search).should eq(search)
      end

      it "redirects to the new_search_path" do
        search = FactoryGirl.create(:search, :participant_id => @participant.id, :step => 3)
        # Trigger the behavior that occurs when invalid params are submitted
        Search.any_instance.stub(:save).and_return(false)
        put :update, {:id => search.to_param, :search => {}}, valid_session
        response.should render_template("searches/steps/step3")
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      auth_admin
    end
    it "destroys the requested search" do
      search = FactoryGirl.create(:search, :participant_id => @participant.id)
      expect {
        delete :destroy, {:id => search.to_param}, valid_session
      }.to change(Search, :count).by(-1)
    end

    it "redirects to the searches list" do
      search = FactoryGirl.create(:search, :participant_id => @participant.id)
      delete :destroy, {:id => search.to_param}, valid_session
      response.should redirect_to(searches_url)
    end
  end

end
