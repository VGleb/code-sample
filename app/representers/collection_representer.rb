class CollectionRepresenter < ::ApplicationRepresenter
  collection(
    :data,
    wrap: false,
    getter: ->(represented:, **) { represented },
    decorator: lambda do |options:, input:, **|
      options[:decorator] || Module.const_get("#{input.class.name}Representer")
    end
  )
end
