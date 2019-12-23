# frozen_string_literal: true

class User
  attr_accessor :name, :roles, :permitions
  def initialize(name)
    @name = name
    @permitions = []
    @roles = []
  end
end
