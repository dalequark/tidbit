json.array!(@question_categories) do |question_category|
  json.extract! question_category, :id, :question_id, :category_id
  json.url question_category_url(question_category, format: :json)
end
