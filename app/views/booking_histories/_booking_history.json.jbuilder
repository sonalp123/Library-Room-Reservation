json.extract! booking_history, :id, :id, :username, :room_num, :start_time, :end_time, :date, :created_at, :updated_at
json.url booking_history_url(booking_history, format: :json)