module InstanceCounter

#в разработке

attr_accessor :instances

  def self.include
    @@instances = 0	
  end

  protected

  def register_instance
  	slef.instances += 1		
  end
end
