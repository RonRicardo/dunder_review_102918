class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to employee_path(@employee)
    else
      render :edit
    end
  end

  def create
    @employee = Employee.new(employee_params)
    byebug
      if @employee.valid?
        @employee.save
        redirect_to employee_path(@employee)
      else
        # redirect_to new_employee_path
        render :new
      end

    # params =
    # "employee"=> {"first_name"=>"Bruce", "last_name"=>"Lee",
    #   "alias"=>"Fast", "title"=>"Cool", "office"=>"Somewhere",
    #   "img_url"=>"https://media.giphy.com/media/3oKIPBxpm5tHqcL1Ic/giphy.gif",
    #   "dog_id"=>"2"},
    # @employee = Employee.new(first_name: params[:employee][:first_name],
    #                          last_name: params[:employee][:last_name],
    #                          alias: params[:employee][:alias],
    #                          title: params[:employee][:title],
    #                          office: params[:employee][:office],
    #                          img_url: params[:employee][:img_url],
    #                          dog_id: params[:employee][:dog_id])
  end

  private
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
