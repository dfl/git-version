module GitVersion
  module ControllerMethods
    def html_status(color:)
      output = <<-HTML
      <!DOCTYPE html>
      <html>
        <body style="background-color: #{color}; color: white; text-align: center; font-family: sans-serif;">
        Git Version:
          <p id="revision">#{git_version}</p>
        </body>
      </html>
      HTML
      output.html_safe
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
