class LimitedQuery
  attr_accessor :relation, :offset, :limit, :order, :direction

  DEFAULT_OFFSET = 0
  DEFAULT_LIMIT = 1000
  MAX_LIMIT = 1000
  DEFAULT_ORDER = :created_at
  DEFAULT_DIRECTION = :desc

  delegate :count, to: :@count_relation

  delegate_missing_to :relation

  def initialize(params, relation, max_limit = MAX_LIMIT)
    @limit = params.fetch(:limit, DEFAULT_LIMIT).to_i
    @limit = max_limit if @limit > max_limit
    @offset = params.fetch(:offset, DEFAULT_OFFSET).to_i
    @order = params.fetch(:order, DEFAULT_ORDER).to_sym
    @direction = fetch_direction(params[:direction])
    @count_relation = relation

    @relation = relation
      .order(order => direction)
      .limit(limit)
      .offset(offset)
  end

  def meta
    {total: count, offset: offset, limit: limit}
  end

  private

  def fetch_direction(direction)
    ActiveRecord::QueryMethods::VALID_DIRECTIONS.include?(direction) ? direction : DEFAULT_DIRECTION
  end
end
