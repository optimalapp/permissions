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
