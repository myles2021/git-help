cd lab/
pwd
query="Reservations[0].Instances[0].PublicDnsName"
origin_url=$(aws ec2 describe-instances --region us-west-2 --filters "Name=tag:Name,Values=Git Server" --query $query)
origin_url=$(echo $origin_url | sed 's/"\(.*\)"/git:\/\/\1\/lab.git/')
echo $origin_url
git remote add origin $origin_url
git remote set-url origin $origin_url
git push -u origin master
git status

# couples fixes via branch and merge
git branch port
git branch world
git checkout port
git status
git add .
git commit -m "port fix"
git push origin port
git status
git checkout world 
git checkout master 
git merge port
git checkout world 
git pull origin master
git status
git add .
git commit -m "world typo"
git push origin world
git checkout master 
git merge world 
git pull origin master 
cat server.js 
git add .
git commit -m "fixes"
git push origin master 
