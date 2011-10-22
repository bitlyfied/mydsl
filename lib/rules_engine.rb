class RulesEngine

  def initialize (&block)
    @variables = []
    @rules = []

    instance_eval &block
  end

  def domain (variables)
    @variables = variables
  end

  def rule (name, &block)
    @rules << Rule.new(name, @variables, &block)
  end

  def evaluate
    variables = yield
    @rules.each do |rule|
      result = rule.evaluate variables
      return result if result
    end
  end

  class << self

    def add (name, &block)
      @engines ||= {}
      @engines[name.to_sym] = self.new &block
    end

    def [](name)
      @engines[name]
    end
  end
end