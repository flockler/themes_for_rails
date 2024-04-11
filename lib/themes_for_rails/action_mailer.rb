# frozen_string_literal: true

module ThemesForRails

  module ActionMailer

    def mail(headers = {}, &block)
      if theme_opts = headers[:theme] || self.class.default[:theme]
        theme(theme_opts)
      end

      super(headers, &block)
    end
  end
end
