module InstanceCounter

  def self.included(base)
 	base.extend ClassMethods
 	base.send :include, InstanceMethods
 	base.instances = 0
  end

  module ClassMethods
    attr_accessor :instances
  end
  
  protected

  module InstanceMethods

    def register_instance
  	  slef.class.instances += 1		
    end
  end
end
