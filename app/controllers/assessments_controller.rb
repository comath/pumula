class AssessmentsController < ApplicationController
  before_action :set_assessment, only: [:show, :edit, :update, :destroy]
  before_action :clean_params, only: [:update,:create]
  before_action :set_assessment_weight, only: [:new]
  before_action :set_course_instance

  # GET /assessments
  # GET /assessments.json
  def index
    @assessments = Assessment.all
  end

  # GET /assessments/1
  # GET /assessments/1.json
  def show
  end

  # GET /assessments/new
  def new
    if params[:assessment_weight_id]
      @hastype = true
      @assessment_weight = AssessmentWeight.find(params[:assessment_weight_id])
      @assessment = Assessment.new(assessment_weight: @assessment_weight, name: @assessment_weight.name)
      problem = @assessment.problems.build
    else
      @hastype = false
      @assessment = Assessment.new
      problem = @assessment.problems.build
    end
  end

  # GET /assessments/1/edit
  def edit
  end

  # POST /assessments
  # POST /assessments.json
  def create
    @assessment = Assessment.new(assessment_weight: @assessment_weight, course_instance: @course_instance, name: @new_name, problems_attributes: @new_problems)

    respond_to do |format|
      if @assessment.save
        format.html { redirect_to [@course_instance,@assessment], notice: 'assessment was successfully created.' }
        format.json { render :show, status: :created, location: [@course_instance,@assessment] }
      else
        format.html { render :new }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessments/1
  # PATCH/PUT /assessments/1.json
  def update

    respond_to do |format|
      if @assessment.update(assessment_weight_id: @assessment_weight_id, name: @new_name, problems_attributes: @new_problems)
        format.html { redirect_to @assessment, notice: 'assessment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assessment }
      else
        format.html { render :edit }
        format.json { render json: @assessment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessments/1
  # DELETE /assessments/1.json
  def destroy
    @assessment.destroy
    respond_to do |format|
      format.html { redirect_to assessments_url, notice: 'assessment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment
      @assessment = Assessment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_params
      params[:assessment]
    end

    def set_course_instance
      @course_instance=CourseInstance.find(params[:course_instance_id])
    end

    def clean_params
      @new_name = assessment_params[:name]
      @new_problems = assessment_params[:problems_attributes].values
      @assessment_weight_id = assessment_params[:assessment_weight]
    end

    def set_assessment_weight
      @assessment_weight=AssessmentWeight.find(params[:assessment_weight_id])
    end
end
