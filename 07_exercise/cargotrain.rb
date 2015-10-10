require_relative 'train'

class CargoTrain < Train

  def initialize(number)
  	super(number, "cargo")
  end
  
  def hook(wagon)
  	raise HookError, "You can't hook this wagon" if wagon.class != CargoWagon
  	super(wagon)
  end
end