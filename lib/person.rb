class Person
attr_accessor ::name, :birthday, :hair_color, :eye_color, :height, 
:weight, :handed, :complexion, :t_shirt_size, 
:wrist_size, :glove_size, :pant_length, :pant_width
attributes = []

  def initialize(**kwargs)
    kwargs.each_pair do |method, value|
      create_accessors(method, value)
      public_send("#{method}=", value)
    end
  end

  private

  def create_accessors(method, value)
    # Adds code to every instance
    # self.class.instance_eval do
    #   define_method "#{method}=" do |value|
    #     instance_variable_set("@#{method}", value)
    #   end
    #   define_method method do
    #     instance_variable_get("@#{method}")
    #   end
    # end
    #
    # Adds code to each instance separately. 2 Instances won't have the same
    # accessors unless their keys are are the same during initialization
    instance_eval <<-CODE
      def #{method}=(v)
        @#{method} = v
      end
      def #{method}
        @#{method}
      end
    CODE
  end
enddef send  
  
  
end
