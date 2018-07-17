class Event::CreateValidator < ::ApplicationValidator
  validations do
    required(:city_id).filled(:city_exists?)
    required(:title).filled(max_size?: 150)
    required(:address).filled(max_size?: 150)
    required(:start_time).filled
    required(:end_time).filled
  end
end
