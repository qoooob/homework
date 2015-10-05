require_relative 'train'

class PassengerTrain < Train

  def initialize(train_number)
  	super(train_number, "passenger")
  end
  
  def hook(wagon)
  	super if wagon.is_a?(PassengerWagon)
  end
end