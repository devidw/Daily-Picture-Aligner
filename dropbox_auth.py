#!/usr/bin/env python3

import dropbox
from dropbox import DropboxOAuth2FlowNoRedirect
import os

'''
This example walks through a basic oauth flow using the existing long-lived token type
Populate your app key and app secret in order to run this locally
'''
APP_KEY = os.environ.get("APP_KEY")
APP_SECRET = os.environ.get("APP_SECRET")

# Create a Dropbox OAuth2 flow object
auth_flow = dropbox.DropboxOAuth2FlowNoRedirect(APP_KEY, APP_SECRET, token_access_type='offline')

# Get the authorization URL
authorize_url = auth_flow.start()
print("1. Go to: " + authorize_url)
print("2. Click 'Allow' (you might have to log in first).")
print("3. Copy the authorization code.")

# Get the authorization code from the user
auth_code = input("Enter the authorization code here: ").strip()

# Exchange the authorization code for access and refresh tokens
oauth_result = auth_flow.finish(auth_code)

# Print the access and refresh tokens
print("Access token: " + oauth_result.access_token)
print("Refresh token: " + oauth_result.refresh_token)
