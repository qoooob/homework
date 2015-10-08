module InstanceCounter

  def self.included(base)
 	base.extend ClassMethods
 	base.send :instances, InstanceMethodes
 	base.instances = 0
  end

  module ClassMethodes
    attr_accessor :instances
  end
  
  protected

  module InstanceMethodes

    def register_instance
  	  slef.class.instances += 1		
    end
  end
end
