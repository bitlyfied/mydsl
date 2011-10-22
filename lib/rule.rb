class Rule
  def initialize (name, variables, &block)
    @name = name
    @block = block
  end

  def evaluate (variables)
    variables.each do |k, v|
      instance_variable_set '@' + k.to_s, v
    end
    instance_eval &@block
  end
end