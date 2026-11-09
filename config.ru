# config.ru
root = File.expand_path File.dirname(__FILE__)
require File.join(root, 'appsinatra.rb')

run MyAppModule::App