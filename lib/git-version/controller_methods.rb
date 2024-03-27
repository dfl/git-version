module GitVersion
  module ControllerMethods
    private

    # overload method from Rails::HealthController
    def html_status(color:)
      render "version/show", layout: false, locals: { color: color, git_version: git_version }
    end

    def git_version
      from_environment || from_config_file || from_git_repo
    end

    def from_environment
      ENV['COMMIT_HASH']
    end

    def version_file
      Rails.root.join("config","version.txt")
    end

    def from_config_file
      version_file&.read.match(/\$Id: ([a-zA-Z0-9]*) \$/)[1] rescue nil
    end

    def from_git_repo
      `git rev-parse HEAD`
    end

  end
end
