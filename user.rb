# frozen_string_literal: true

class User
  attr_accessor :name, :roles, :permissions
  def initialize(name)
    @name = name
    @permissions = []
    @roles = []
  end
end
