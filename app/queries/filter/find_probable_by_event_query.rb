class Filter::FindProbableByEventQuery
  attr_accessor :relation

  delegate_missing_to :relation

  def initialize(event, relation = ::Filter)
    @relation = relation
    @relation = @relation.where(relation.arel_table[:created_at].lteq(event.created_at))
    @relation = @relation.where("(params ->> 'start_time')::timestamp >= ?", event.start_time)
    @relation = @relation.where("(params ->> 'end_time')::timestamp <= ?", event.end_time)
    @relation = @relation.where("params ->> 'city_id' = ?", event.city_id.to_s)
  end
end
