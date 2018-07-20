class Filter::CreateValidator < ::ApplicationValidator
  validations do
    required(:params).schema do
      optional(:city_id).filled(:city_exists?)
      optional(:event_topic_title).maybe
      optional(:start_time).filled
      optional(:end_time).filled
    end
  end
end
