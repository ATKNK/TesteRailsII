class FixUserResultsQuestionnaireReference < ActiveRecord::Migration[8.1]
  def change
    rename_column :user_results, :questionnaires_id, :questionnaire_id
    rename_column :user_answer_histories, :questionnaires_id, :questionnaire_id
  end
end
