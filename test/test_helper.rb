# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"

$:.unshift File.dirname(__FILE__)
require "rails_app/config/environment"
require "rails/test_help"
