json.extract! library_room, :id, :number, :building, :booked, :size, :created_at, :updated_at
json.url library_room_url(library_room, format: :json)