import dropbox
import os

# Create a Dropbox client using the refresh token
dbx = dropbox.Dropbox(
        oauth2_refresh_token=os.environ.get("DROPBOX_REFRESH_TOKEN"), 
        app_key=os.environ.get("APP_KEY"),
        app_secret=os.environ.get("APP_SECRET"),
        )

dbx.files_download_zip_to_file("./dl.zip", "/Apps/Close-up")
