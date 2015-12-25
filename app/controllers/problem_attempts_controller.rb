class ProblemAttemptsController < ApplicationController
  before_action :set_problem_attempt, only: [:show, :edit, :update, :destroy]

  # GET /problem_attempts
  # GET /problem_attempts.json
  def index
    @problem_attempts = ProblemAttempt.all
  end

  # GET /problem_attempts/1
  # GET /problem_attempts/1.json
  def show
  end

  # GET /problem_attempts/new
  def new
    @problem_attempt = ProblemAttempt.new
  end

  # GET /problem_attempts/1/edit
  def edit
  end

  # POST /problem_attempts
  # POST /problem_attempts.json
  def create
    @problem_attempt = ProblemAttempt.new(problem_attempt_params)

    respond_to do |format|
      if @problem_attempt.save
        format.html { redirect_to @problem_attempt, notice: 'Problem attempt was successfully created.' }
        format.json { render :show, status: :created, location: @problem_attempt }
      else
        format.html { render :new }
        format.json { render json: @problem_attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problem_attempts/1
  # PATCH/PUT /problem_attempts/1.json
  def update
    respond_to do |format|
      if @problem_attempt.update(problem_attempt_params)
        format.html { redirect_to @problem_attempt, notice: 'Problem attempt was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem_attempt }
      else
        format.html { render :edit }
        format.json { render json: @problem_attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problem_attempts/1
  # DELETE /problem_attempts/1.json
  def destroy
    @problem_attempt.destroy
    respond_to do |format|
      format.html { redirect_to problem_attempts_url, notice: 'Problem attempt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem_attempt
      @problem_attempt = ProblemAttempt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_attempt_params
      params[:problem_attempt]
    end
end
