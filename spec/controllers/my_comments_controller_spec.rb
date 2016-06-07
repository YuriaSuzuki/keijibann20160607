require 'rails_helper'

describe MyCommentsController, type: :controller do

  describe "user login" do
    before do
      user = create(:user)
      login(user)
    end

    describe 'POST #create' do
      before :each do
        @our_thread = create(:our_thread)
        @my_comment_b = build(:my_comment, our_thread: @our_thread)
        @my_comment_c = create(:my_comment, our_thread: @our_thread)
      end
      context 'with valid attributes' do
        it "saves the new my_comment in database" do
          expect{post :create, my_comment: attributes_for(:my_comment), id: @my_comment_b, our_thread_id: @our_thread.id}.to change(MyComment, :count).by(1)
        end

        it "redirects to our_threads#show" do
          post :create, my_comment: attributes_for(:my_comment), id: @my_comment_c, our_thread_id: @our_thread
          expect(response).to redirect_to ("/our_threads/#{assigns(:our_thread).id}")
        end
      end
      context 'with invalid attributes' do
         it "doesn't save the new my_comment in the database" do
           expect{post :create, my_comment: attributes_for(:invalid_my_comment), id: @my_comment_b, our_thread_id: @our_thread.id}.not_to change(MyComment, :count)
         end
         it "redirects to our_threads#show" do
           post :create, my_comment: attributes_for(:my_comment), id: @my_comment_c, our_thread_id: @our_thread
           expect(response).to redirect_to ("/our_threads/#{assigns(:our_thread).id}")
         end
      end
    end

    describe 'GET #edit' do
      before :each do
        @our_thread = create(:our_thread)
        @my_comment = create(:my_comment, our_thread: @our_thread)
      end
      it "assigns the requested contact to @my_comment" do

        get :edit, my_comment: attributes_for(:my_comment), id: @my_comment, our_thread_id: @our_thread
        expect(assigns(:my_comment)).to eq @my_comment
      end
      it "renders the :edit template" do

        get :edit, my_comment: attributes_for(:my_comment), id: @my_comment, our_thread_id: @our_thread
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      before :each do
        @our_thread = create(:our_thread)
        @my_comment = create(:my_comment,
        id: 1,
        title: 'comment1',
        created_at: 2016-06-05,
        updated_at: 2016-06-05,
        user_id: 1,
        our_thread: @our_thread
        )
      end
      context 'with correct user_id' do
        context 'with valid attributes' do
          it "locates the requested @my_comment" do
            patch :update, id: @my_comment, our_thread_id: @our_thread, my_comment: attributes_for(:my_comment)
            expect(assigns(:my_comment)).to eq(@my_comment)
          end
          it "changes @my_comment's attributes" do
            patch :update, id: @my_comment, our_thread_id: @our_thread,
            my_comment: attributes_for(:my_comment,
            id: 1,
            title: 'comment2',
            created_at: 2016-06-05,
            updated_at: 2016-06-05,
            user_id: 1,
            our_thread: @our_thread
            )
            @my_comment.reload
            expect(@my_comment.title).to eq('comment2')
          end
          it "redirects to our_threads#show" do
            patch :update, id: @my_comment, our_thread_id: @our_thread, my_comment: attributes_for(:my_comment)
            expect(response).to redirect_to ("/our_threads/#{assigns(:our_thread).id}")
          end
        end
        context 'with invalid attributes' do
          it "doesn't update the my_comment" do
            patch :update, id: @my_comment, our_thread_id: @our_thread, my_comment: attributes_for(:my_comment)
            expect(@my_comment.title).not_to eq('comment2')
          end
          it "redirects to our_threads#show" do
            patch :update, id: @my_comment, our_thread_id: @our_thread, my_comment: attributes_for(:my_comment)
            expect(response).to redirect_to ("/our_threads/#{assigns(:our_thread).id}")
          end
        end
      end
      context 'with uncorrect user_id' do
        it "redirects to our_threads#show" do
          patch :update, id: @my_comment, our_thread_id: @our_thread, my_comment: attributes_for(:my_comment)
          expect(response).to redirect_to ("/our_threads/#{assigns(:our_thread).id}")
        end
      end
    end

    describe 'DELETE #destroy' do
      before :each do
        @our_thread = create(:our_thread)
        @my_comment = create(:my_comment, our_thread: @our_thread)
      end
      context 'with correct user_id' do
        it "deletes the my_comment" do
          expect{delete :destroy, my_comment: attributes_for(:my_comment), id: @my_comment, our_thread_id: @our_thread.id}.to change(MyComment, :count).by(-1)
        end
        it "redirects to our_threads#show" do
          post :create, my_comment: attributes_for(:my_comment), id: @my_comment, our_thread_id: @our_thread
          expect(response).to redirect_to ("/our_threads/#{assigns(:our_thread).id}")
        end
      end
    end
  end
end
