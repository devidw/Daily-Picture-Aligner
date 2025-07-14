source ./abc/bin/activate
source ./.env

mkdir -p ./dl

rm -r ./dl

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

convert -size 2316x3088 xc:white ./AlignedPhotos/0.jpg

ffmpeg -y -framerate 12 -i ./AlignedPhotos/%d.jpg -c:v libvpx-vp9 -crf 50 -b:v 0 -r 30 -pix_fmt yuv420p output.webm

# python ./upload.py
