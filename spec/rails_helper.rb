# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'


# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:each) do 
    @bob = User.create(name: "Bob", email: "bob@email.com", password_digest: "1234")
    @angel = User.create(name: "Angel", email: "angel@email.com", password_digest: "password")
    
    @anxious_andy = Distortion.create(name: "Anxious Andy")
    @macho_mike = Distortion.create(name: "Macho Mike")
    @hurtful_harry = Distortion.create(name: "Hurtful Harry")
    @belittling_betty = Distortion.create(name: "Belittling Betty")
    @critical_carl = Distortion.create(name: "Critical Carl")
    @superstitious_sally = Distortion.create(name: "Superstitious Sally")

    @school_tag = Tag.create(name: "school")
    @relationship_tag = Tag.create(name: "relationship")
    @work_tag = Tag.create(name: "work")

    @log = @bob.logs.build(content: "I always lose.", before_rating: 1, after_rating: 2, distortion_id: 1, tags: [@work_tag], created_at: "2016-03-15 22:14:34" )
    @log1 = @bob.logs.build(content: "I should have done better.", before_rating: 5, after_rating: 6, distortion_id: 2, tags: [@work_tag, @school_tag], created_at: "2016-03-14 22:14:34")
    @log2 = @bob.logs.build(content: "Nobody likes me.", before_rating: 2, after_rating: 7, distortion_id: 3, tags: [@work_tag, @relationship_tag], created_at: "2016-03-13 22:14:34")
    @log3 = @angel.logs.build(content: "If I'm not perfect I have failed.", before_rating: 1, after_rating: 9, distortion_id: 4, tags: [@work_tag, @school_tag, @relationship_tag], created_at: "2016-03-12 22:14:34")
    @log4 =@angel.logs.build(content: "I feel embarassed so I must be an idiot.", before_rating: 4, after_rating: 10, distortion_id: 5, tags: [@school_tag, @work_tag])

    @ladybug_one = LadyBug.create(content: "you had a really great time with your friends yesterday")
    @ladybug_two = LadyBug.create(content: "you finished all of your homework early")
    @ladybug_three = LadyBug.create(content: "you got an A on that test")

    @bob.save
    @angel.save
  end


  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end