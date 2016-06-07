require 'rails_helper'

describe OurThreadsController, type: :controller do

  describe "user login" do
    before do
      user = create(:user)
      login(user)
    end

    describe 'GET #index' do
      it "it gets all the record from our_threads" do
        @our_thread =create(:our_thread,
        id: 1,
        title: 'test1',
        created_at: 2016-06-01,
        updated_at: 2016-06-01,
        user_id: 10)
        our_thread = create(:our_thread)
        get :index
        expect(assigns(:our_threads)).to match_array [@our_thread,our_thread]
      end
      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #show' do
      before :each do
        @our_thread = create(:our_thread)
        get :show, id: @our_thread
      end
      it "assigns the requested OurThread to @our_thread" do
        expect(assigns(:our_thread)).to eq @our_thread
      end
      it "rensers the :show template" do
        expect(response).to render_template :show
      end
    end

    describe 'GET #new' do
      it "assigns a new OurThread to @our_thread" do
        get :new
        expect(assigns(:our_thread)).to be_a_new(OurThread)
      end
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'GET #create' do
      context "with valid attributes" do
        it "saves the new our_thread in the database" do
          expect{post :create, our_thread: attributes_for(:our_thread)}.to change(OurThread, :count).by(1)
        end
        it "redirects to our_threads#index" do
          post :create, our_thread: attributes_for(:our_thread)
          expect(response).to redirect_to ("/our_threads")
        end
      end

      context "with invalid attributes" do
        it "does not save the new our_thread in the database" do
          expect{post :create, our_thread: attributes_for(:invalid_our_thread)}.not_to change(OurThread, :count)
        end
        it "re-renders the :new template" do
            post :create, our_thread: attributes_for(:invalid_our_thread)
            expect(response).to render_template :new
        end
      end
    end

    describe 'GET #edit' do
      before :each do
        @our_thread = create(:our_thread)
        get :edit, id: @our_thread
      end
      it "assigns the requested OurThread to @our_thread" do
        expect(assigns(:our_thread)).to eq @our_thread
      end
      it "renders the :edit template" do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      before :each do
        @our_thread =create(:our_thread,
        id: 1,
        title: 'test1',
        created_at: 2016-06-01,
        updated_at: 2016-06-01,
        user_id: 1)
      end
      context "with correct user_id" do
        context "with valid attributes" do
          it "locates the requested @our_thread" do
            patch :update, id: @our_thread, our_thread: attributes_for(:our_thread)
            expect(assigns(:our_thread)).to eq(@our_thread)
          end
          it "changes @our_thread's attributes" do
            patch :update, id: @our_thread,
            our_thread: attributes_for(:our_thread,
            id: 1,
            title: 'test2',
            created_at: 2016-06-01,
            updated_at: 2016-06-01,
            user_id: 1)
            @our_thread.reload
            expect(@our_thread.title).to eq('test2')
          end
          it "redirects to our_threads#index" do
            patch :update, id: @our_thread, our_thread: attributes_for(:our_thread)
            expect(response).to redirect_to ("/our_threads")
          end
        end
        context "with invalid attributes" do
          it "does not change the our_thread's attributes" do
            patch :update, id: @our_thread, our_thread: attributes_for(:our_thread)
            expect(@our_thread.title).not_to eq('test2')
          end
          it "re-renders the :edit template" do
            patch :update, id: @our_thread, our_thread: attributes_for(:invalid_our_thread)
            expect(response).to render_template :edit
          end
        end
      end
      context "with uncorrect user_id" do
        it "re-renders the :edit template" do
          patch :update, id: @our_thread, our_thread: attributes_for(:invalid_our_thread)
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      before :each do
        @our_thread = create(:our_thread)
      end
      context "with correct user_id" do
        it "deletes the our_thread" do
          expect{ delete :destroy, id: @our_thread }.to change(OurThread, :count).by(-1)
        end
        it "redirects to our_threads#index" do
          delete :destroy, id: @our_thread
          expect(response).to redirect_to our_threads_path
        end
      end
      context "with incorrect user_id" do
        it "redirects to our_threads#index" do
          delete :destroy, id: @our_thread
          expect(response).to redirect_to our_threads_path
        end
      end
    end
  end
end
