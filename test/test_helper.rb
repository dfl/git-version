# frozen_string_literal: true

ENV["RAILS_ENV"] = "test"

require File.expand_path("../lib/git-version", __dir__)
require "rails/test_help"
require 'shoulda'
