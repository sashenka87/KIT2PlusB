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

describe ParticipantsController do
  render_views

  # This should return the minimal set of attributes required to create a valid
  # Participant. As you add validations to Participant, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { :first_name => "alex", :last_name => "list", :instructor => "dr a", :country => "usa"}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ParticipantsController. Be sure to keep this updated too.
  def valid_session
    { :session_id => "woot" }
  end

  describe "GET index" do
    before(:each) do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV["ADMIN_USER"]}:#{ENV["ADMIN_PASS"]}")
    end
    
    it "assigns all participants as @participants" do
      participant = FactoryGirl.create(:participant)
      get :index, {}, valid_session
      assigns(:participants).should eq([participant])
    end
  end

  describe "GET show" do
    before(:each) do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV["ADMIN_USER"]}:#{ENV["ADMIN_PASS"]}")
    end
    
    it "assigns the requested participant as @participant" do
      participant = FactoryGirl.create(:participant)
      get :show, {:id => participant.to_param}, valid_session
      assigns(:participant).should eq(participant)
    end
  end

  describe "GET new" do
    it "assigns a new participant as @participant" do
      get :new, {}, valid_session
      assigns(:participant).should be_a_new(Participant)
    end
  end

  # describe "GET edit" do
  #   it "assigns the requested participant as @participant" do
  #     participant = Participant.create! valid_attributes
  #     get :edit, {:id => participant.to_param}, valid_session
  #     assigns(:participant).should eq(participant)
  #   end
  # end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Participant" do
        expect {
          post :create, {:participant => valid_attributes}, valid_session
        }.to change(Participant, :count).by(1)
      end

      it "assigns a newly created participant as @participant" do
        post :create, {:participant => valid_attributes}, valid_session
        assigns(:participant).should be_a(Participant)
        assigns(:participant).should be_persisted
      end

      it "redirects to the created participant" do
        post :create, {:participant => valid_attributes}, valid_session
        response.should redirect_to(new_demographic_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved participant as @participant" do
        # Trigger the behavior that occurs when invalid params are submitted
        Participant.any_instance.stub(:save).and_return(false)
        post :create, {:participant => {}}, valid_session
        assigns(:participant).should be_a_new(Participant)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Participant.any_instance.stub(:save).and_return(false)
        post :create, {:participant => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested participant" do
  #       participant = Participant.create! valid_attributes
  #       # Assuming there are no other participants in the database, this
  #       # specifies that the Participant created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       Participant.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, {:id => participant.to_param, :participant => {'these' => 'params'}}, valid_session
  #     end
  # 
  #     it "assigns the requested participant as @participant" do
  #       participant = Participant.create! valid_attributes
  #       put :update, {:id => participant.to_param, :participant => valid_attributes}, valid_session
  #       assigns(:participant).should eq(participant)
  #     end
  # 
  #     it "redirects to the participant" do
  #       participant = Participant.create! valid_attributes
  #       put :update, {:id => participant.to_param, :participant => valid_attributes}, valid_session
  #       response.should redirect_to(participant)
  #     end
  #   end
  # 
  #   describe "with invalid params" do
  #     it "assigns the participant as @participant" do
  #       participant = Participant.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Participant.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => participant.to_param, :participant => {}}, valid_session
  #       assigns(:participant).should eq(participant)
  #     end
  # 
  #     it "re-renders the 'edit' template" do
  #       participant = Participant.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Participant.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => participant.to_param, :participant => {}}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
  # end

  describe "DELETE destroy" do
    before(:each) do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{ENV["ADMIN_USER"]}:#{ENV["ADMIN_PASS"]}")
    end
    
    it "destroys the requested participant" do
      participant = FactoryGirl.create(:participant)
      expect {
        delete :destroy, {:id => participant.to_param}, valid_session
      }.to change(Participant, :count).by(-1)
    end

    it "redirects to the participants list" do
      participant = FactoryGirl.create(:participant)
      delete :destroy, {:id => participant.to_param}, valid_session
      response.should redirect_to(participants_url)
    end
  end

end
