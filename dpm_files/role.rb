# frozen_string_literal: true

class Role
  attr_accessor :name, :permitions
  def initialize(_name)
    @name = _name
    @permitions = []
  end
end
