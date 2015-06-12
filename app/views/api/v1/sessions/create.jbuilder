json.user do
  json.access_token @user.access_token
  json.user_id @user.id.to_s
end
