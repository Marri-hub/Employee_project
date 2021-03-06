class EmployeesController < ApplicationController
  before_action :load_filters, only: ['edit','update','show','destroy','download_pdf']
    def index
        @employees = if params[:q] && !params[:q].blank?
          Employee.where(name: params[:q])
          else 
        Employee.all
    end
  end

      def jagadeesh
        @employees = Employee.all.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Posts",
               page_size: "A4",
               template: "employees/employee.pdf.erb"
      end
    end

  end
    
    

        def show    
          @employee = Employee.find(params[:id])
          respond_to do |format|
            format.html
            format.pdf do
              render pdf: "Posts",
                     page_size: "A4",
                     template: "employees/show.pdf.erb"
            end
          end
    end


        def show     
        end

        def new
          @employee =  Employee.new
        end

        def create
        @employee = Employee.new(employee_params)
        if @employee.save
            EmployeeMailer.notify_employee_creation(@employee.id).deliver_now
        redirect_to employees_path
        else
        render :new
        end
        end

        def edit      
        end

      def aboutus
      end

      def contact
      end

      def home
      end

        def update  
        if @employee.update(employee_params)
        redirect_to employees_path
        else
        render :edit
        end
        end

        def destroy
        @employee.destroy
        redirect_to employees_path
        end

        def download_pdf    
            send_file("#{Rails.root}/public/sample.pdf",
            filename: "#{@employee.name}.pdf", 
            type: "application/pdf")

            
            end


        
             end

        private
        def employee_params
        params.require(:employee).permit(:name,:department, :salary, :upload_image)
        end
        
        def load_filters
          @employee = Employee.find(params[:id])
        end
        end

