class Wagon

  attr_accessor :number
  
  def initialize(number)
  	@number = number
  	validate!
  end

  def valid?
    validate!
    true
  rescue ArgumentError
    false
  end

  protected

  def validate!
    wagon_number = /^\d\d/
    raise ArgumentError, "Number can't be blank" if number.nil? || number.empty?
    raise ArgumentError, "Number should be at least 2 digitals" if number.length != 2
    raise ArgumentError, "Wrong number format! For example 12" if number !~ wagon_number
  end
end