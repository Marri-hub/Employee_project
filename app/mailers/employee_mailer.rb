class EmployeeMailer < ApplicationMailer
    def notify_employee_creation(employee_id)
        @employee = Employee.find(employee_id)
        mail(to: ['satyanarayana22121999@gmail.com','ambulanaveen21@gmail.com','navyans2391@gmail.com'],  subject: "Employee #{@employee.name} has been created!")
        end

end
