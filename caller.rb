# frozen_string_literal: true

require_relative 'permitions'
require_relative 'role'
require_relative 'user'

class Caller
  include Permitions
  attr_accessor :user
end

caller = Caller.new
caller.create_user('John Travolta')
caller.add_role('admin')
caller.add_role('user')

permition = 'reboot the server'
caller.grant_permition_to_role('admin', permition)
caller.grant_permition_to_role('user', permition)
caller.check_role_permition_presence(permition)

permition_2 = 'creating files'
caller.grant_permition_to_user(permition_2)
caller.check_user_permition_presence(permition_2)

caller.has_role_permitions?
caller.has_user_permitions?
