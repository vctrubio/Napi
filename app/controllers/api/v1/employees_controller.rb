class Api::V1::EmployeesController < Api::V1::BaseController
  before_action :set_employee, only: [ :show, :update, :destroy ]

  def index
    @employees = Employee.all
  end

  def create
    @employee = Employee.new(employee_params)
    authorize @restaurant
    if @employee.save
      render :show, status: :created
    else
      render_error
    end
  end

  def show
  end

  def update
    if @employee.update(employee_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @employee.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :phone, :credit, :description, :archive)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def render_error
    render json: { errors: @employee.errors.full_messages },
      status: :unprocessable_entity
  end

end
