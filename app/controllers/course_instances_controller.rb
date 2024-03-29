class CourseInstancesController < ApplicationController
  before_action :set_course_instance, only: [:show, :edit, :update, :destroy]

  # GET /course_instances
  # GET /course_instances.json
  def index
    @course_instances = CourseInstance.all
  end

  # GET /course_instances/1
  # GET /course_instances/1.json
  def show
  end

  # GET /course_instances/new
  def new
    @course_instance = CourseInstance.new
  end

  # GET /course_instances/1/edit
  def edit
  end

  # POST /course_instances
  # POST /course_instances.json
  def create
    @course_instance = CourseInstance.new(course_instance_params)

    respond_to do |format|
      if @course_instance.save
        format.html { redirect_to @course_instance, notice: 'Course instance was successfully created.' }
        format.json { render :show, status: :created, location: @course_instance }
      else
        format.html { render :new }
        format.json { render json: @course_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_instances/1
  # PATCH/PUT /course_instances/1.json
  def update
    respond_to do |format|
      if @course_instance.update(course_instance_params)
        format.html { redirect_to @course_instance, notice: 'Course instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_instance }
      else
        format.html { render :edit }
        format.json { render json: @course_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_instances/1
  # DELETE /course_instances/1.json
  def destroy
    @course_instance.destroy
    respond_to do |format|
      format.html { redirect_to course_instances_url, notice: 'Course instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_instance
      @course_instance = CourseInstance.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def course_instance_params
      params[:course_instance]
    end
end
