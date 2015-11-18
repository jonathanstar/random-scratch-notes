rails new my_great_app -T -d postgresql --skip-turbolinks
cd my_great_app
git init
git add .
git commit -m "Initial commit. Rails boilerplate."

#Edit Gemfile. Uncomment the reference to bcrypt and remove the reference to coffee-rails.

bundle install
git add .
git commit -m "Enable bcrypt."

#Edit Gemfile. Add gem rspec-rails (and probably faker and factory_girl_rails if wanted) to the development, test group toward the bottom of the Gemfile.
# add 'rspec-rails' to gemfile

bundle install
rails g rspec:install
git add .
git commit -m "Initialize rspec."

#Create the repo on github. Don't add a .gitignore or license.

git remote add origin https://github.com/your_organization/my_great_app.git
git push -u origin master

#Only now start adding your own code. Apart from ensuring all your tools are in place, doing all the install steps up front gives you a good point to compare back to later
