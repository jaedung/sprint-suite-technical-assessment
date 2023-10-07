describe PostsController do
  describe '#index' do
    let!(:post) { create(:post) }
    let(:params) { { page: 1 } }

    it 'returns all posts' do
      get :index, params: params
      expect(response).to have_http_status(:ok)

      posts_assigned = assigns(:posts)
      expect(posts_assigned[0]).to eq post
    end
  end

  describe '#show' do
    let(:post) { create(:post) }

    it 'returns a show on id' do
      get :show, params: { id: post.id }
      expect(response).to have_http_status(:ok)

      post_assgined = assigns(:post)
      expect(post).to eq post_assgined
    end
  end

  describe '#update' do
    let(:post) { create(:post) }
    let(:content) { FFaker::Lorem.paragraph }
    let(:source) { 'facebook' }
    let(:posted_at) { '08/10/2023' }
    let(:params) {
      {
        id: post.id,
        post: {
          content: content,
          source: source,
          posted_at: posted_at
        }
      }
    }

    it 'updates the post' do
      put :update, params: params
      expect(response).to redirect_to(post_path(post))

      post.reload
      expect(post.content).to eq content
      expect(post.source).to eq source
      expect(post.posted_at).to eq posted_at.to_datetime
    end
  end

  describe '#destroy' do
    let(:post) { create(:post) }

    it 'destroys the post' do
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to(posts_path)
      expect { post.reload }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end

  describe '#search' do
    let!(:post) { create(:post) }
    let(:params) {
      {
        page: 1,
        query: {
          start_date: '',
          end_date: '',
          social_media_type: '',
          list: ''
        }
      }
    }

    it 'returns searched posts' do
      get :search, params: params
      expect(response).to have_http_status(:ok)

      posts_assigned = assigns(:posts)
      expect(posts_assigned[0]).to eq post
    end
  end
end
