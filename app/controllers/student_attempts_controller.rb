class StudentAttemptsController < ApplicationController
  before_action :set_student_attempt, only: [:show, :edit, :update]
  before_action :set_course_instance, :set_section, :set_assigment, :set_student

  # GET /student_attempts
  # GET /student_attempts.json
  def index
    @student_attempts = StudentAttempt.all
  end

  # GET /student_attempts/1
  # GET /student_attempts/1.json
  def show
  end

  # ADD JSON
  # GET /student_attempts/new
  def new
    @student_attempt = @student.student_attempts.new(assessment: @assessment)
    @student_attempt.save
    @assessment.problems.all.each do |problem|
      problem_attempt = @student_attempt.problem_attempts.build(problem: problem, score: 0, completed: true)
      problem_attempt.save
    end
    @problem_attempts = @student_attempt.problem_attempts.all
    flash[:student_attempt] = @student_attempt.id
  end


  # GET /student_attempts/1/edit
  def edit
  end

  # POST /student_attempts
  # POST /student_attempts.json
  def create
    @student_attempt = StudentAttempt.new(student_attempt_params)

    respond_to do |format|
      if @student_attempt.save
        format.html { redirect_to @student_attempt, notice: 'Student attempt was successfully created.' }
        format.json { render :show, status: :created, location: @student_attempt }
      else
        format.html { render :new }
        format.json { render json: @student_attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_attempts/1
  # PATCH/PUT /student_attempts/1.json
  def update
    new_scores = student_attempt_params[:problem_attempts_attributes].values
    respond_to do |format|
      if @student_attempt.update(problem_attempts_attributes: new_scores)
        format.html { redirect_to @course_instance, notice: "#{@student.name} attempt at #{@assessment.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @student_attempt }
      else
        format.html { render :edit }
        format.json { render json: @student_attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_attempts/1
  # DELETE /student_attempts/1.json
  def destroy
    @student_attempt.destroy
    respond_to do |format|
      format.html { redirect_to student_attempts_url, notice: 'Student attempt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_attempt
      @student_attempt = StudentAttempt.find(params[:student_attempt_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_attempt_params
      params[:student_attempt]
    end

    def set_course_instance
      @course_instance=CourseInstance.find(params[:course_instance_id])
    end

    def set_section
      @section=Section.find(params[:section_id])
    end

    def set_student
      @student=Student.find(params[:student_id])
    end

    def set_assigment
      @assessment=Assessment.find(params[:assessment_id])
    end
end
