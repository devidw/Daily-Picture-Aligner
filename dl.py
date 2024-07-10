import dropbox
import os

storage = dropbox.Dropbox(oauth2_access_token=os.environ.get("DROPBOX_API_KEY"))

storage.files_download_zip_to_file("./dl.zip", "/Apps/Close-up")