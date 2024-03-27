require "test_helper"

class HealthControllerTest < ActionDispatch::IntegrationTest
  context 'GET /health' do
    setup do
      @action  = -> { get rails_health_check_path }
      ENV['COMMIT_HASH'] = nil
    end

    context "with a commit hash" do
      setup do
        ENV['COMMIT_HASH'] = '12345'
      end
      should_respond_with :success, matching: /12345/
    end

    context "with a version.txt file" do
      setup do
        @tmpfile = Rails.root.join("tmp","version.txt")
        @tmpfile.write('$Id: 055c8729cdcc372500a08db659c045e16c4409fb $')
        HealthController.any_instance.stubs(:version_file).returns(@tmpfile)
      end

      should_respond_with :success, matching: /055c8729cdcc372500a08db659c045e16c4409fb/

      teardown do
        @tmpfile.delete
      end
    end

    context "with a git repo" do
      setup do
        HealthController.any_instance.stubs(:version_file).returns(nil)
      end

      should_respond_with :success, matching: /#{`git rev-parse HEAD`}/
    end
  end

end
