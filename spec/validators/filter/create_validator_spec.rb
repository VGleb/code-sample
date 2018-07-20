RSpec.describe Filter::CreateValidator do
  describe '.validate' do
    subject { described_class.new(params) }

    let(:params) do
      build(:filter, :without_relationships)
        .slice(:params)
        .merge(params: {city_id: create(:city, :without_relationships).id})
    end

    it_behaves_like 'successful validator'

    it_behaves_like 'failure validator if', params: {city_id: -1}

    it_behaves_like 'failure validator if', params: {start_time: ''}

    it_behaves_like 'failure validator if', params: {end_time: ''}
  end
end
