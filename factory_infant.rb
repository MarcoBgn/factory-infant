require_relative "dsl"
require_relative "factory"
require_relative "user"

class FactoryInfant
  @factories = {}

  def self.registry
    @factories
  end

  def self.define(&block)
    dsl = DSL.new
    dsl.instance_eval(&block)
  end

  def self.build(factory_class, overrides = {})
    instance = factory_class.new

    factory = registry[factory_class]
    attributes = factory.attributes.merge(overrides)
    attributes.each do |attribute_name, value|
      instance.send("#{attribute_name}=", value)
    end
    instance
  end
end
