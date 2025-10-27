class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: %i[ show edit update destroy ]

  # GET /questionnaires
  def index
    @questionnaires = Questionnaire.all
  end

  # GET /questionnaires/1
  def show
    @questions = @questionnaire.questions
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
  end

  # GET /questionnaires/1/edit
  def edit
  end

  # POST /questionnaires
  def create
    @questionnaire = Questionnaire.new(questionnaire_params)

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to @questionnaire, notice: "Questionnaire was successfully created." }
        format.json { render :show, status: :created, location: @questionnaire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnaires/1
  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to @questionnaire, notice: "Questionnaire was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  def destroy
    @questionnaire.destroy!

    respond_to do |format|
      format.html { redirect_to questionnaires_path, notice: "Questionnaire was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  def questionnaire_params
    params.require(:questionnaire).permit(:code, :title, :description, :duration_minutes)
  end
end
