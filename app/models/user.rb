class User < ApplicationRecord
  enum role: [:admin, :teacher, :student, :guardian]
    after_initialize :set_default_role, :if => :new_record?

    def set_default_role
      self.role ||= :student
    end

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
