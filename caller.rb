# frozen_string_literal: true

module Permitions
  def create_user(_name)
    self.user = User.new(_name)
    puts "User: '#{user.name}' created!"
  end

  def create_role(_name)
    user.role = Role.new(_name)
    user.role_name = user.role.name
    puts "Role '#{_name}' created!"
  end

  def grant_permition_to_role(_permition)
    user.role.permitions << _permition
    puts "Added permition: '#{_permition}' to the #{user.role.name}"
  end

  def check_permition_presence(_permition)
    user.role.permitions.include?(_permition) ? true : false
  end

  def grant_permition_to_user(_permition)
    user.permitions << _permition
    puts "Added permition: '#{user.permitions.join}' to #{user.name}"
  end

  def has_role_permitions?
    user.role.permitions.empty? ? false : true
  end

  def has_user_permitions?
    user.permitions.empty? ? false : true
  end
end

class Role
  attr_accessor :name, :permitions
  def initialize(_name)
    @name = _name
    @permitions = []
  end
end

class User
  attr_reader :id
  attr_accessor :name, :role, :role_name, :permitions
  def initialize(name)
    @name = name
    @permitions = []
    @roles = []
  end
end

class Caller
  include Permitions
  attr_accessor :user
end

caller = Caller.new
caller.create_user('John Travolta')
caller.create_role('Admin')
permition = 'reboot the server'
caller.grant_permition_to_role(permition)
puts caller.check_permition_presence(permition)
permition2 = 'write to a file'
caller.grant_permition_to_user(permition2)
puts caller.has_role_permitions?
puts caller.has_user_permitions?
