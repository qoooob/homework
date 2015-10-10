require_relative 'train'

class PassengerTrain < Train

  def initialize(number)
  	super(number, "passenger")
  end
  
  def hook(wagon)
  	raise HookError, "You can't hook this wagon" if wagon.class != PassengerWagon
  	super(wagon)
  end
end