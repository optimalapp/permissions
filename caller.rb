# frozen_string_literal: true

module Permitions
  def create_user(_name)
    self.user = User.new(_name)
    puts "'#{user.name}' created!"
  end

  def add_role(_name)
    user.roles << Role.new(_name)
    puts "Added '#{_name}' role to '#{user.name}'!"
  end

  def grant_permition_to_role(_name, _permition)
    user.roles.each do |r|
      if r.name == _name
        r.permitions << _permition
        puts "Added '#{_permition}' permition to '#{r.name}'"
      end
    end
  end

  def check_role_permition_presence(_permition)
    user.roles.each do |r|
      puts "Permition '#{_permition}' for role, presence: #{r.permitions.include?(_permition)}"
    end
  end

  def grant_permition_to_user(_permition)
    user.permitions << _permition
    puts "Added '#{user.permitions.join}' permition to '#{user.name}'"
  end

  def check_user_permition_presence(_permition)
    puts "Permition '#{_permition}' for user, presence: #{user.permitions.include?(_permition)}"
  end

  def has_role_permitions?
    puts "Role permitions: #{user.roles.any?}"
  end

  def has_user_permitions?
    puts "User permitions: #{user.permitions.any?}"
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
  attr_accessor :name, :roles, :permitions
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
