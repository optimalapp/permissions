# frozen_string_literal: true

class Permission
  attr_accessor :permissions
  def initialize(_permission)
    @permissions = _permission
  end
end
