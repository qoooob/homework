module MyAttrAccessor
  
  def attr_accessor_with_history(*attributes)
    attributes.each do |attribute|
  		attr_name = attr_var(attribute)
  		define_method(attribute) {instance_variable_get(attr_name)}
      define_method("#{attribute}_history") do
        instance_variable_get("@#{attribute}_history")
      end
      
      define_method("#{attribute}=") do |value|
      history = instance_variable_get("@#{attribute}_history")
      instance_variable_set("@#{attribute}_history", []) unless history

      current_val = instance_variable_get(attr_name)
      history = instance_variable_get("@#{attribute}_history")
      history << current_val

      instance_variable_set(attr_name, value)
      end
  	end
  end

  def strong_attr_accessor(attribute, attr_class)
    getter(attribute)
    setter(attribute) do |value|
      raise TypeError, "#{value} не является #{attr_class}" if value.class != attr_class
    end
  end

private

  def attr_var(attribute)
    "@#{attribute}".to_sym
  end

  def getter(attribute)
    attr_name = attr_var(attribute)
    define_method(attribute) {instance_variable_get(attr_name)}
  end

  def setter(attribute)
    attr_name = attr_var(attribute)
    define_method("#{attribute}=") do |value|
      yield(value)
    instance_variable_set(attr_name, value)
    end
  end
end


class Foo
  extend MyAttrAccessor

  attr_accessor_with_history :bar1, :bar2, :bar3
  strong_attr_accessor :bar, String
end

foo = Foo.new
foo.bar1 = 1
foo.bar1 = 5
foo.bar1 = 8
foo.bar1 = 9

puts foo.bar1_history 

foo1 = Foo.new

begin
foo1.bar = 'string' 
#foo1.bar = 5
rescue TypeError => e
  puts e.message
end