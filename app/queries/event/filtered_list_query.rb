class Event::FilteredListQuery
  attr_accessor :relation

  delegate_missing_to :relation

  def initialize(params, relation = ::Event)
    @relation = relation
    if params[:event_topic_title].present?
      @relation = filter_by_event_topic_title(@relation, params[:event_topic_title])
    end
    @relation = filter_by_city_id(@relation, params[:city_id]) if params[:city_id].present?
    @relation = filter_by_start_time(@relation, params[:start_time]) if params[:start_time].present?
    @relation = filter_by_end_time(@relation, params[:end_time]) if params[:end_time].present?
  end

  private

  def filter_by_city_id(relation, city_id)
    relation.where(city_id: city_id)
  end

  def filter_by_start_time(relation, start_time)
    relation.where(relation.arel_table[:start_time].gteq(start_time))
  end

  def filter_by_end_time(relation, end_time)
    relation.where(relation.arel_table[:end_time].lteq(end_time))
  end

  def filter_by_event_topic_title(relation, event_topic_title)
    relation
      .joins(:topics)
      .merge(
        ::Event::Topic.where(::Event::Topic.arel_table[:title].lower.matches("%#{event_topic_title.downcase}%"))
      )
  end
end
