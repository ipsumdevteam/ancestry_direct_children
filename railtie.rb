class RakeGem::Railtie < Rails::Railtie

  rake_tasks do
    load 'tasks/populate.rake' 
  end

end
