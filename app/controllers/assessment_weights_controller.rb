class AssessmentWeightsController < ApplicationController
  before_action :set_assessment_weight, only: [:show, :edit, :update, :destroy]

  # GET /assessment_weights
  # GET /assessment_weights.json
  def index
    @assessment_weights = AssessmentWeight.all
  end

  # GET /assessment_weights/1
  # GET /assessment_weights/1.json
  def show
  end

  # GET /assessment_weights/new
  def new
    @assessment_weight = AssessmentWeight.new
  end

  # GET /assessment_weights/1/edit
  def edit
  end

  # POST /assessment_weights
  # POST /assessment_weights.json
  def create
    @assessment_weight = AssessmentWeight.new(assessment_weight_params)

    respond_to do |format|
      if @assessment_weight.save
        format.html { redirect_to @assessment_weight, notice: 'Assessment weight was successfully created.' }
        format.json { render :show, status: :created, location: @assessment_weight }
      else
        format.html { render :new }
        format.json { render json: @assessment_weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assessment_weights/1
  # PATCH/PUT /assessment_weights/1.json
  def update
    respond_to do |format|
      if @assessment_weight.update(assessment_weight_params)
        format.html { redirect_to @assessment_weight, notice: 'Assessment weight was successfully updated.' }
        format.json { render :show, status: :ok, location: @assessment_weight }
      else
        format.html { render :edit }
        format.json { render json: @assessment_weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assessment_weights/1
  # DELETE /assessment_weights/1.json
  def destroy
    @assessment_weight.destroy
    respond_to do |format|
      format.html { redirect_to assessment_weights_url, notice: 'Assessment weight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assessment_weight
      @assessment_weight = AssessmentWeight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assessment_weight_params
      params[:assessment_weight]
    end
end
