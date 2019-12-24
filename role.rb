# frozen_string_literal: true

class Role
  attr_accessor :name, :permissions
  def initialize(_name)
    @name = _name
    @permissions = []
  end
end
