class Api::V1::EmployeesController < ActionController::API
    def index
    employees = Employee.all
    render json: {message: 'OK', employees: employees.as_json(only: [:name, :department, :salary, :created_at])}.to_json, status: 200
    end
    def show
    employee = Employee.find(params[:id])
    if employee
    render json: {message: 'OK', employee: employee}.to_json, status: 200
    else
    render json: {message: 'Error', error: 'Employee not found with the given id'}.to_json, status: 404
    end
    rescue => e
    render json: {message: 'Error', error: e.message }.to_json, status: 500
    end
    def create
    employee = Employee.new(employee_params)
    if employee.save
    render json: {message: 'OK', employee: employee}.to_json, status: :created
    else
    render json: {message: 'Error', error: 'employee couldnt create'}.to_json, status: 404
    end
    end
    private
    def employee_params
    params.require(:employee).permit(:name, :department, :salary)
    end
    end