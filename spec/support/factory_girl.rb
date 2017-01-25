# spec/support/factory_girl.rb
puts "Support/FactoryGirl\n"
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before(:all) do
    FactoryGirl.reload
  end
end