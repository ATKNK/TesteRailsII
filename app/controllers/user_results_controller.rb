class UserResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_questionnaire

  def new
    @questions = @questionnaire.questions.includes(:question_options)
  end

  def create
    answers = params.fetch(:answers, {})
    total = @questionnaire.questions.count
    correct = 0

    @questionnaire.questions.each do |q|
      selected_option_id = answers[q.id.to_s]
      correct_option = q.question_options.find_by(is_correct: true)
      correct += 1 if correct_option && selected_option_id.present? && correct_option.id.to_s == selected_option_id.to_s
    end

    score = (correct.to_f / total * 100).round(2)

    @user_result = UserResult.create(
      user: current_user,
      questionnaire: @questionnaire,
      correct_answers: correct,
      total_questions: total,
      score: score,
      submitted_at: Time.current
    )

    redirect_to questionnaire_path(@questionnaire), notice: "Quiz enviado. Você acertou #{correct}/#{total} (#{score}%)"
  end

  private

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:questionnaire_id])
  end
end
