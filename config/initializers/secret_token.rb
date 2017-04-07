# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Messenger::Application.config.secret_key_base = 'eca3187abb2022567d5a1bf8818f7d505f6ca04c20f6e95bcdce09ffc018a1bb4f2ac85e654f2bb85bf4495827fef6232ef00e6257860db0172334df7892bf5a'
