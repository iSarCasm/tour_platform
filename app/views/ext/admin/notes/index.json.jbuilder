json.notes @notes do |note|
  json.id note.id
  json.user_name note.user_name
  json.message note.message
  json.created_at note.created_at
end
