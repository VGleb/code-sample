class TestSchema < ::ApplicationValidator
  validations do
    required(:params).schema do
      optional(:city_id).filled(:city_exists?)
      optional(:event_topic_title).filled(:str?)
      optional(:start_time).filled
      optional(:end_time).filled
    end
  end
end
