import dropbox
import os

storage = dropbox.Dropbox(oauth2_access_token=os.environ.get("DROPBOX_API_KEY"))

with open("./output.mp4", "rb") as f:
    vid = f.read()
    storage.files_upload(vid, "/daily.mp4")