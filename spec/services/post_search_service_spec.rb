describe PostSearchService do
  subject { described_class.new(query) }

  let(:list) { create(:list) }
  let!(:list_member) { create(:list_member, list: list) }
  let!(:post) { create(:post, list_member: list_member) }

  let(:list_name) { list.name }
  let(:social_media_type) { post.source }
  let(:start_date) { 2.weeks.ago.strftime('%Y-%m-%d') }
  let(:end_date) { DateTime.now.strftime('%Y-%m-%d') }
  let(:query) {
    {
      list: list_name,
      social_media_type: social_media_type,
      start_date: start_date,
      end_date: end_date
    }
  }

  context 'when no query is given' do
    let(:query) {
      {
        list: '',
        social_media_type: '',
        start_date: '',
        end_date: ''
      }
    }

    it 'returns default posts' do
      results = subject.run
      expect(results[0]['id']).to eq post.id
      expect(results[0]['list_member_id']).to eq post.list_member_id
      expect(results[0]['source']).to eq post.source
      expect(results[0]['content']).to eq post.content
    end
  end

  context 'when list query is given' do
    let(:query) {
      {
        list: list_name,
        social_media_type: '',
        start_date: '',
        end_date: ''
      }
    }

    it 'returns posts from the matching list' do
      results = subject.run
      expect(results.length).to eq 1
    end
  end

  context 'when social_media_type query is given' do
    let(:social_media_type) { post.source }
    let(:query) {
      {
        list: '',
        social_media_type: social_media_type,
        start_date: '',
        end_date: ''
      }
    }

    it 'returns posts on the social_media_type query' do
      results = subject.run
      expect(results.length).to eq 1
    end
  end

  context 'when start_date query is given' do
    let(:posted_at) { 5.days.ago }
    let(:post) { create(:post, list_member: list_member, posted_at: posted_at) }
    let(:start_date) { 10.days.ago.strftime('%Y-%m-%d') }
    let(:query) {
      {
        list: '',
        social_media_type: '',
        start_date: start_date,
        end_date: ''
      }
    }

    it 'returns posts that were posted after the start date' do
      results = subject.run
      expect(results.length).to eq 1
    end
  end

  context 'when end_date query is given' do
    let(:posted_at) { 5.days.ago }
    let(:post) { create(:post, list_member: list_member, posted_at: posted_at) }
    let(:end_date) { 2.days.ago.strftime('%Y-%m-%d') }
    let(:query) {
      {
        list: '',
        social_media_type: '',
        start_date: '',
        end_date: end_date
      }
    }

    it 'returns posts that were posted before the end date' do
      results = subject.run
      expect(results.length).to eq 1
    end
  end
end
