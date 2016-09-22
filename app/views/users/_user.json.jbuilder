json.extract! user, :id, :username, :email, :password_hash, :password_salt, :created_at, :updated_at
json.url user_url(user, format: :json)