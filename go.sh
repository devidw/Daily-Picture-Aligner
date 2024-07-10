python ./dl.py

unzip ./dl.zip -d dl

mkdir -p ./BaseImages
mkdir -p ./AlignedPhotos
mkdir -p ./DailyPhotos

rm ./BaseImages/*
rm ./DailyPhotos/*
rm ./AlignedPhotos/*

cp ./dl/Close-up/* ./DailyPhotos/

rm ./DailyPhotos/*.heic

last_item=$(ls -1t ./DailyPhotos | head -1)

cp ./DailyPhotos/$last_item ./BaseImages/

python ./main.py

for file in ./AlignedPhotos/*_*.jpg_Aligned.jpg; do
  new_name="${file%%_*}.jpg"
  mv "$file" "$new_name"
done

ffmpeg -framerate 12 -i ./AlignedPhotos/%d.jpg -c:v libx264 -r 30 -pix_fmt
yuv420p output.mp4

python ./upload.py