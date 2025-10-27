class QuestionOptionsController < ApplicationController
  before_action :set_question_option, only: %i[ show edit update destroy ]
  before_action :set_questions, only: %i[ new edit create update ]

  # GET /question_options
  def index
    @question_options = QuestionOption.all
  end

  # GET /question_options/1
  def show
  end

  # GET /question_options/new
  def new
    @question_option = QuestionOption.new
  end

  # GET /question_options/1/edit
  def edit
  end

  # POST /question_options
  def create
    @question_option = QuestionOption.new(question_option_params)
    @questions = Question.all  # garante que a variável exista se houver erro no form

    if @question_option.save
      redirect_to @question_option, notice: "Question option was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /question_options/1
  def update
    @questions = Question.all

    if @question_option.update(question_option_params)
      redirect_to @question_option, notice: "Question option was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /question_options/1
  def destroy
    @question_option.destroy
    redirect_to question_options_url, notice: "Question option was successfully destroyed."
  end

  private

  def set_question_option
    @question_option = QuestionOption.find(params[:id])
  end

  def set_questions
    @questions = Question.all
  end

  def question_option_params
    params.require(:question_option).permit(:title, :is_correct, :question_id)
  end
end
