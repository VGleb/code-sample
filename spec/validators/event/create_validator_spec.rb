RSpec.describe Event::CreateValidator do
  describe '.validate' do
    subject { described_class.new(params) }

    let(:params) do
      build(:event, :without_relationships, city: create(:city, :without_relationships)).slice(
        :city_id,
        :title,
        :address,
        :start_time,
        :end_time
      )
    end

    it_behaves_like 'successful validator'

    it_behaves_like 'failure validator if', city_id: nil

    it_behaves_like 'failure validator if', city_id: -1

    it_behaves_like 'failure validator if', title: nil

    it_behaves_like 'failure validator if', title: 'a'*151

    it_behaves_like 'failure validator if', address: nil

    it_behaves_like 'failure validator if', address: 'a'*151

    it_behaves_like 'failure validator if', start_time: nil

    it_behaves_like 'failure validator if', end_time: nil
  end
end
