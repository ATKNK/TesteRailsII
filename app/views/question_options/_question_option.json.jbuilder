json.extract! question_option, :id, :title, :is_correct, :questions_id, :created_at, :updated_at
json.url question_option_url(question_option, format: :json)
