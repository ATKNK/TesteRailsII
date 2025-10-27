class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  before_action :set_questionnaires, only: %i[ new edit create update ]

  # GET /questions
  def index
    @questions = Question.includes(:questionnaire).all
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: "Question was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  def destroy
    # Para soft delete:
    @question.update(deleted_at: Time.current)

    respond_to do |format|
      format.html { redirect_to questions_path, notice: "Question was successfully deleted.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_questionnaires
    @questionnaires = Questionnaire.all
  end

  def question_params
    params.require(:question).permit(:enunciation, :questionnaire_id)
  end
end
