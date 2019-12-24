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

  def grant_permission_to_role(_role, _permission)
    users.each do |user|
      user.roles.each do |r|
        if r.name == _role
          r.permissions << _permission
          puts "Added '#{_permission}' permission to '#{_role}'"
        end
      end
    end
  end

  def check_role_permission_presence(_permission)
    users.each do |user|
      user.roles.each do |r|
        puts "Permition '#{_permission}' for role, presence: #{r.permissions.include?(_permission)}"
      end
    end
  end

  def grant_permission_to_user(_name, _permission)
    user = users.find { |n| n.name == _name }
    user.permissions << _permission
    puts "Added '#{user.permissions.join}' permission to '#{user.name}'"
  end

  def check_user_permission_presence(_permission)
    users.each do |user|
      puts "Permition '#{_permission}' for user, presence: #{user.permissions.include?(_permission)}"
    end
  end

  def has_role_permissions?
    users.each do |user|
      puts "Role permissions: #{user.roles.any?}"
    end
  end

  def has_user_permissions?
    users.each do |user|
      puts "User permissions: #{user.permissions.any?}"
    end
  end
end
