f = Rails.root + Rails.configuration.database_configuration[Rails.env]["database"]
FileUtils.copy f, "#{f}-backup"
