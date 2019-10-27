Rails.application.config.middleware.use OmniAuth::Builder do 
    provider :github, 'dba5451455cc62be72c7', '420420c223e98c959c91b1f6a6ea98ba942d73a1' 
end