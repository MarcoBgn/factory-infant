class DSL
  def factory(class_name, &block)
    factory = Factory.new
    if block_given?
      factory.instance_eval(&block)
    end
    FactoryInfant.registry[class_name] = factory
  end
end
