require 'rails_helper'

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

RSpec.describe ContentsController, type: :controller do

  let(:invalid_attributes) {
    {
      file: "", 
      uploaded_by: ""
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #show" do
    it "assigns the requested content as @content" do
      folder = create(:folder)
      content = create(:content, folder_id: folder.id) 
      get :show, { folder_token: folder.token, id: content.id }, valid_session
      expect(assigns(:content)).to eq(content)
    end
  end
  
  describe "POST #create" do
    let(:folder) { create(:folder) }
    
    context "with valid params" do
      let(:valid_attributes) { { file: fixture_file_upload('ruby.png', 'image/png') } }
    
      it "creates a new Content" do
        expect {
          post :create, { folder_token: folder.token, content: valid_attributes }, valid_session
        }.to change(Content, :count).by(1)
      end

      it "assigns a newly created content as @content" do
        post :create, { folder_token: folder.token, content: valid_attributes }, valid_session
        expect(assigns(:content)).to be_a(Content)
        expect(assigns(:content)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved content as @content" do
        post :create, { folder_token: folder.token, content: invalid_attributes }, valid_session
        expect(assigns(:content)).to be_a_new(Content)
      end
    end
  end

#  describe "DELETE #destroy" do
#    it "destroys the requested content" do
#      content = Content.create! valid_attributes
#      expect {
#        delete :destroy, {:id => content.to_param}, valid_session
#      }.to change(Content, :count).by(-1)
#    end
#
#    it "redirects to the contents list" do
#      content = Content.create! valid_attributes
#      delete :destroy, {:id => content.to_param}, valid_session
#      expect(response).to redirect_to(contents_url)
#    end
#  end

end
