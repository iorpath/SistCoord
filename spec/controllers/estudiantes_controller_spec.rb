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

describe EstudiantesController do

  # This should return the minimal set of attributes required to create a valid
  # Estudiante. As you add validations to Estudiante, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EstudiantesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all estudiantes as @estudiantes" do
      estudiante = Estudiante.create! valid_attributes
      get :index, {}, valid_session
      assigns(:estudiantes).should eq([estudiante])
    end
  end

  describe "GET show" do
    it "assigns the requested estudiante as @estudiante" do
      estudiante = Estudiante.create! valid_attributes
      get :show, {:id => estudiante.to_param}, valid_session
      assigns(:estudiante).should eq(estudiante)
    end
  end

  describe "GET new" do
    it "assigns a new estudiante as @estudiante" do
      get :new, {}, valid_session
      assigns(:estudiante).should be_a_new(Estudiante)
    end
  end

  describe "GET edit" do
    it "assigns the requested estudiante as @estudiante" do
      estudiante = Estudiante.create! valid_attributes
      get :edit, {:id => estudiante.to_param}, valid_session
      assigns(:estudiante).should eq(estudiante)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Estudiante" do
        expect {
          post :create, {:estudiante => valid_attributes}, valid_session
        }.to change(Estudiante, :count).by(1)
      end

      it "assigns a newly created estudiante as @estudiante" do
        post :create, {:estudiante => valid_attributes}, valid_session
        assigns(:estudiante).should be_a(Estudiante)
        assigns(:estudiante).should be_persisted
      end

      it "redirects to the created estudiante" do
        post :create, {:estudiante => valid_attributes}, valid_session
        response.should redirect_to(Estudiante.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved estudiante as @estudiante" do
        # Trigger the behavior that occurs when invalid params are submitted
        Estudiante.any_instance.stub(:save).and_return(false)
        post :create, {:estudiante => {}}, valid_session
        assigns(:estudiante).should be_a_new(Estudiante)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Estudiante.any_instance.stub(:save).and_return(false)
        post :create, {:estudiante => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested estudiante" do
        estudiante = Estudiante.create! valid_attributes
        # Assuming there are no other estudiantes in the database, this
        # specifies that the Estudiante created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Estudiante.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => estudiante.to_param, :estudiante => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested estudiante as @estudiante" do
        estudiante = Estudiante.create! valid_attributes
        put :update, {:id => estudiante.to_param, :estudiante => valid_attributes}, valid_session
        assigns(:estudiante).should eq(estudiante)
      end

      it "redirects to the estudiante" do
        estudiante = Estudiante.create! valid_attributes
        put :update, {:id => estudiante.to_param, :estudiante => valid_attributes}, valid_session
        response.should redirect_to(estudiante)
      end
    end

    describe "with invalid params" do
      it "assigns the estudiante as @estudiante" do
        estudiante = Estudiante.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Estudiante.any_instance.stub(:save).and_return(false)
        put :update, {:id => estudiante.to_param, :estudiante => {}}, valid_session
        assigns(:estudiante).should eq(estudiante)
      end

      it "re-renders the 'edit' template" do
        estudiante = Estudiante.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Estudiante.any_instance.stub(:save).and_return(false)
        put :update, {:id => estudiante.to_param, :estudiante => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested estudiante" do
      estudiante = Estudiante.create! valid_attributes
      expect {
        delete :destroy, {:id => estudiante.to_param}, valid_session
      }.to change(Estudiante, :count).by(-1)
    end

    it "redirects to the estudiantes list" do
      estudiante = Estudiante.create! valid_attributes
      delete :destroy, {:id => estudiante.to_param}, valid_session
      response.should redirect_to(estudiantes_url)
    end
  end

end
