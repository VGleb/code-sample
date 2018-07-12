class ApplicationOrganizer
  include Interactor::Organizer

  def self.transaction(enabled = nil)
    @transaction = enabled.presence || @transaction || false
  end

  def call
    self.class.transaction ? ActiveRecord::Base.transaction { super } : super
  end
end
