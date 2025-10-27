json.extract! question, :id, :enunciation, :deleted_at, :questionnaire_id, :created_at, :updated_at
json.url question_url(question, format: :json)
