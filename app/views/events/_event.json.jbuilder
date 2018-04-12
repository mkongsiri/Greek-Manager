json.extract! event, :id, :chapter_id, :type, :date, :name, :description, :notes, :created_at, :updated_at
json.url event_url(event, format: :json)
