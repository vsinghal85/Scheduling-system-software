RailsAdmin.config do |config|
  # REQUIRED:
  # Include the import action
  # See https://github.com/sferik/rails_admin/wiki/Actions
  config.actions do
    all
    import
  end

  # Optional:
  # Configure global RailsAdminImport options
  config.configure_with(:import) do |config|
    config.logging = true
  end

  # Optional:
  # Configure model-specific options using standard RailsAdmin DSL
  # See https://github.com/sferik/rails_admin/wiki/Railsadmin-DSL
  config.model 'User' do
    import do
      include_all_fields
      exclude_fields :secret_token
    end
  end



  config.model 'Client' do
    import do
      mapping_key :email
    end
  end
  
  config.model 'Teacher' do
    import do
      mapping_key :email
    end
  end

  config.model 'Event' do 
    import do
      mapping_key :title
    end
    # ...
  end


end