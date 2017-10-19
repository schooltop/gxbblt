class Employee < ApplicationRecord
	has_and_belongs_to_many :roles
  serialize :tag

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    EMPLOYEE_COLUMNS = {
    	name: 0,
	    email: 1,
	    mobile: 2
    }     

    def self.save_from_hash(hash)
      employee = Employee.find_or_initialize_by(email: hash[:email])
      employee.assign_attributes(name: hash[:name],
                                 mobile: hash[:mobile],
                                 password:11111111)
      employee.save
    end     

end