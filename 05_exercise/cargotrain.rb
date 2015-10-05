require_relative 'train'

class CargoTrain < Train

  def initialize(train_number)
  	super(train_number, "cargo")
  end
  
  def hook(wagon)
  	super(wagon) if wagon.class == CargoWagon
  end
end