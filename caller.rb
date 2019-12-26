# frozen_string_literal: true

require_relative 'permissions'
require_relative 'role'
require_relative 'user'
require_relative 'permission'
class Caller
  include Permissions
  attr_accessor :users
  def initialize
    @users = []
  end
end

caller = Caller.new
user_name = 'John Travolta'
caller.create_user(user_name)
caller.add_role_to_user(user_name, 'admin')
caller.add_role_to_user(user_name, 'user')

permission = 'reboot the server'
caller.grant_permission_to_role('admin', permission)
caller.check_role_permission_presence(permission)

permission_2 = 'creating files'
caller.grant_permission_to_user(user_name, permission_2)
caller.check_user_permission_presence(permission_2)

caller.has_role_permissions?
caller.has_user_permissions?
