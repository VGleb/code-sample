class ApplicationModel < ::ApplicationRecord
  self.abstract_class = true

  default_scope { where(deleted_at: nil) }

  def self.deleted
    unscope(where: :deleted_at).where.not(deleted_at: nil)
  end

  def self.with_deleted
    unscope(where: :deleted_at)
  end

  def decorate
    @_decorator_obj ||= decorator.new(self)
  end

  private

  def decorator
    @_decorator ||= Module.const_get("#{self.class.name}Decorator")
  end
end
