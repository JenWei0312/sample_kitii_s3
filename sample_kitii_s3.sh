cd ~/Documents/DVC/sample_data
git init
dvc init
git commit -m "initiate dvc"

dvc add train
git add train.dvc .gitignore
git commit -m "add processed kitii train folder"

dvc add validation
git add validation.dvc .gitignore
git commit -m "add processed kitii validation folder"

dvc remote add -d storage s3://veerum-development-ai-datasets/sample_kitii

git add .dvc/config
git commit -m "Configure s3 remote storage"
dvc push

git remote add origin https://github.com/JenWei0312/sample_kitii_s3.git
git branch -m master main
git push -u origin main
