require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe FormSubmissionsController do

  def mock_form_submission(stubs={})
    @mock_form_submission ||= mock_model(FormSubmission, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all form_submissions as @form_submissions" do
      FormSubmission.stub(:all) { [mock_form_submission] }
      get :index
      assigns(:form_submissions).should eq([mock_form_submission])
    end
  end

  describe "GET show" do
    it "assigns the requested form_submission as @form_submission" do
      FormSubmission.stub(:find).with("37") { mock_form_submission }
      get :show, :id => "37"
      assigns(:form_submission).should be(mock_form_submission)
    end
  end

  describe "GET new" do
    it "assigns a new form_submission as @form_submission" do
      FormSubmission.stub(:new) { mock_form_submission }
      get :new
      assigns(:form_submission).should be(mock_form_submission)
    end
  end

  describe "GET edit" do
    it "assigns the requested form_submission as @form_submission" do
      FormSubmission.stub(:find).with("37") { mock_form_submission }
      get :edit, :id => "37"
      assigns(:form_submission).should be(mock_form_submission)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created form_submission as @form_submission" do
        FormSubmission.stub(:new).with({'these' => 'params'}) { mock_form_submission(:save => true) }
        post :create, :form_submission => {'these' => 'params'}
        assigns(:form_submission).should be(mock_form_submission)
      end

      it "redirects to the created form_submission" do
        FormSubmission.stub(:new) { mock_form_submission(:save => true) }
        post :create, :form_submission => {}
        response.should redirect_to(form_submission_url(mock_form_submission))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved form_submission as @form_submission" do
        FormSubmission.stub(:new).with({'these' => 'params'}) { mock_form_submission(:save => false) }
        post :create, :form_submission => {'these' => 'params'}
        assigns(:form_submission).should be(mock_form_submission)
      end

      it "re-renders the 'new' template" do
        FormSubmission.stub(:new) { mock_form_submission(:save => false) }
        post :create, :form_submission => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested form_submission" do
        FormSubmission.stub(:find).with("37") { mock_form_submission }
        mock_form_submission.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :form_submission => {'these' => 'params'}
      end

      it "assigns the requested form_submission as @form_submission" do
        FormSubmission.stub(:find) { mock_form_submission(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:form_submission).should be(mock_form_submission)
      end

      it "redirects to the form_submission" do
        FormSubmission.stub(:find) { mock_form_submission(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(form_submission_url(mock_form_submission))
      end
    end

    describe "with invalid params" do
      it "assigns the form_submission as @form_submission" do
        FormSubmission.stub(:find) { mock_form_submission(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:form_submission).should be(mock_form_submission)
      end

      it "re-renders the 'edit' template" do
        FormSubmission.stub(:find) { mock_form_submission(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested form_submission" do
      FormSubmission.stub(:find).with("37") { mock_form_submission }
      mock_form_submission.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the form_submissions list" do
      FormSubmission.stub(:find) { mock_form_submission }
      delete :destroy, :id => "1"
      response.should redirect_to(form_submissions_url)
    end
  end

end
