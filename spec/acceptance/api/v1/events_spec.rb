resource 'Event', document: :v1 do
  include_context 'headers'
  include_context 'response_object'

  get '/api/v1/events/' do
    parameter :limit, 'List limit'
    parameter :offset, 'List offset'
    parameter :order, 'List order'
    parameter :direction, 'List direction (asc/desc)'
    parameter :event_topic_title, 'Part of title of event topic'
    parameter :city_id, 'Id of City'
    parameter :start_time, 'Event start time'
    parameter :end_time, 'Event end time'

    context 'when there are events' do
      before do
        create(:event, :without_relationships, start_time: 5.days.ago, end_time: 3.days.ago)
        create(:event, :without_relationships, start_time: 5.days.since, end_time: 7.days.since)
        create(:event, :without_relationships, start_time: Time.current, end_time: 1.day.since)
        create(:event, :without_relationships, start_time: 1.day.since, end_time: 2.days.since)
      end

      it_behaves_like 'resource list', size: 4

      context 'and when event topic title is specified', document: false do
        let(:event_topic_title) { 'please' }

        before do
          create(:event_topic, :without_relationships, event: ::Event.last, title: 'Find me, please')
          create(:event_topic, :without_relationships, event: ::Event.second, title: 'Do not find me')
        end

        example_request 'List with one item' do
          expect(status).to eq(200)
          expect_json_sizes(data: 1)
        end
      end

      context 'and when city id is specified', document: false do
        let(:city) { create(:city, :without_relationships) }
        let(:city_id) { city.id }

        before do
          ::Event.first.update!(city: city)
          ::Event.last.update!(city: city)
          ::Event.second.update!(city: create(:city, :without_relationships))
        end

        example_request 'List with two items' do
          expect(status).to eq(200)
          expect_json_sizes(data: 2)
        end
      end

      context 'and when start time is specified', document: false do
        let(:start_time) { Time.current.beginning_of_day }

        example_request 'List with three items' do
          expect(status).to eq(200)
          expect_json_sizes(data: 3)
        end
      end

      context 'and when end time is specified', document: false do
        let(:end_time) { Time.current.end_of_day }

        example_request 'List with one item' do
          expect(status).to eq(200)
          expect_json_sizes(data: 1)
        end
      end

      context 'and when user is authenticated', document: false do
        let(:user) { create(:user, :without_relationships) }
        let(:event_topic_title) { 'hello' }

        before { sign_in(user) }

        example 'Empty list and create filter' do
          do_request
          expect(status).to eq(200)
          expect_json_sizes(data: 0)
          expect(::Filter.last.params['event_topic_title']).to eq(event_topic_title)
        end
      end
    end

    context 'when there are no events', document: false do
      example_request 'Empty list' do
        expect(status).to eq(200)
        expect_json_sizes(data: 0)
      end
    end
  end

  post '/api/v1/events/', skip: true do
    # TODO: Implementation
  end
end
