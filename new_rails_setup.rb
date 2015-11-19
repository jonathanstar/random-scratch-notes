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

# in rails helper change the following assignment from true to false

config.use_transactional_fixtures = false

# uncomment the following line in spec/rails_helper.rb

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

#create a database cleaner initializer 

touch config/database_cleaner.rb

# add this code to database_cleaner.rb
RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

# uncomment 

#Create the repo on github. Don't add a .gitignore or license.

git remote add origin https://github.com/your_organization/my_great_app.git
git push -u origin master

#Only now start adding your own code. Apart from ensuring all your tools are in place, doing all the install steps up front gives you a good point to compare back to later


# when you want test coverage you must add the following to spec/rails_helper
