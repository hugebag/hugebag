module ModelHelpers
  def method_missing(method_name, *args)
    if method_name =~ /(\w+)_zero_if_nil$/
      super unless has_attribute?($1)
      self[$1].nil? ? 0.0 : self[$1]
    elsif method_name =~ /(\w+)_nil_or_zero\?$/
      super unless has_attribute?($1)
      self[$1].nil? or self[$1] == 0.0
    elsif method_name =~ /positive_(\w+)\?$/
      super unless has_attribute?($1)
      self[$1].present? and self[$1] > 0.0
    else
      super
    end
  end
end