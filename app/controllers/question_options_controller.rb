class QuestionOptionsController < ApplicationController
  before_action :set_question_option, only: %i[ show edit update destroy ]
  before_action :set_questions, only: %i[ new edit create update ]

  def index
    @question_options = QuestionOption.includes(:question).all
  end

  def show; end

  def new
    @question_option = QuestionOption.new
  end

  def edit; end

  def create
    @question_option = QuestionOption.new(question_option_params)

    if @question_option.save
      redirect_to @question_option, notice: "Question option was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @question_option.update(question_option_params)
      redirect_to @question_option, notice: "Question option was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question_option.soft_destroy
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
