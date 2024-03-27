# frozen_string_literal: true

if ::Rails::HealthController
  class GitVersion::VersionController < Rails::HealthController
  end
else
  class GitVersion::VersionController < ActionController::Base
    rescue_from(Exception) { render_down }

    def show
      render_up
    end

    private
      def render_up
        render html: html_status(color: "green")
      end

      def render_down
        render html: html_status(color: "red"), status: 500
      end

      def html_status(color:)
        %(<!DOCTYPE html><html><body style="background-color: #{color}"></body></html>).html_safe
      end
    end
  end

end

GitVersion::VersionController.send :include, GitVersion::ControllerMethods
