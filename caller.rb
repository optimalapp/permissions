# frozen_string_literal: true

require_relative 'permitions'
require_relative 'role'
require_relative 'user'

class Caller
  include Permitions
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

permition = 'reboot the server'
caller.grant_permition_to_role('admin', permition)
caller.check_role_permition_presence(permition)

permition_2 = 'creating files'
caller.grant_permition_to_user(user_name, permition_2)
caller.check_user_permition_presence(permition_2)

caller.has_role_permitions?
caller.has_user_permitions?
