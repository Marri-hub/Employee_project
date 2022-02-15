class EmployeeMailer < ApplicationMailer
    def notify_employee_creation(employee_id)
        @employee = Employee.find(employee_id)
        mail(to: 'saijagadeesh9703@gmail.com', subject: "Employee #{@employee.name} has been created!")
        end
end
