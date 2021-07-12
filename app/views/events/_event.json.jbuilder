json.extract! event, :id, :theme, :venue, :details, :event_start_date, :event_end_date, :event_start_time, :event_end_time, :created_at, :updated_at
json.url event_url(event, format: :json)
