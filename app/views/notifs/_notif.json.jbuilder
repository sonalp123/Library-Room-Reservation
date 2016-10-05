json.extract! notif, :id, :username, :message, :date, :sender, :read, :created_at, :updated_at
json.url notif_url(notif, format: :json)