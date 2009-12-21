module ActsAsComplexParam
  def acts_as_param(*attrs)
    options = attrs.extract_options!
    @@param = attrs
    @@param.define_method(:separator, options[:separator] || '-')
    include InstanceMethods unless included_modules.include?(InstanceMethods)
  end
  
  module InstanceMethods
    def to_param
      @@param.join @@param.separator
    end
    
    def find_by_param!(value)
      attrs = value.split @@param.separator
      send("find_by_#{ @@param.join('_and_') }!", *attrs)
    end
    alias_method(:find_by_param, :find_by_param!)
  end
end

ActiveRecord::Base.send(:extend, ActsAsComplexParam)
