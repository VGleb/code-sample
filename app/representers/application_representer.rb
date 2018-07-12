class ApplicationRepresenter < Representable::Decorator
  include Representable::JSON

  def to_hash(options = {}, _binding_builder = Binding)
    hash = super
    hash = {meta: options[:meta]}.merge(hash) if options[:meta]
    hash
  end
end
