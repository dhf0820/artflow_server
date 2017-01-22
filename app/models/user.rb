class User < ApplicationRecord
  acts_as_paranoid

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  AVAILABLE_ROLES= [ :super_admin, :admin, :csr, :artist ]

  def roles_applied
    roles.collect(&:name).join(", ")
  end

  def reset_roles
    AVAILABLE_ROLES.each do |role|
      self.remove_role role
    end
  end
end
