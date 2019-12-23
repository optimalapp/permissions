# frozen_string_literal: true

module Permissions
  def create_user(_name)
    users << User.new(_name)
    puts "'#{_name}' created!"
  end

  def add_role_to_user(_name, _role)
    user = users.find { |n| n.name == _name }
    user.roles << Role.new(_role)
    puts "Added '#{_role}' role to '#{user.name}'!"
  end

  def grant_permition_to_role(_role, _permition)
    users.each do |user|
      user.roles.each do |r|
        if r.name == _role
          r.permitions << _permition
          puts "Added '#{_permition}' permition to '#{_role}'"
        end
      end
    end
  end

  def check_role_permition_presence(_permition)
    users.each do |user|
      user.roles.each do |r|
        puts "Permition '#{_permition}' for role, presence: #{r.permitions.include?(_permition)}"
      end
    end
  end

  def grant_permition_to_user(_name, _permition)
    user = users.find { |n| n.name == _name }
    user.permitions << _permition
    puts "Added '#{user.permitions.join}' permition to '#{user.name}'"
  end

  def check_user_permition_presence(_permition)
    users.each do |user|
      puts "Permition '#{_permition}' for user, presence: #{user.permitions.include?(_permition)}"
    end
  end

  def has_role_permitions?
    users.each do |user|
      puts "Role permitions: #{user.roles.any?}"
    end
  end

  def has_user_permitions?
    users.each do |user|
      puts "User permitions: #{user.permitions.any?}"
    end
  end
end
