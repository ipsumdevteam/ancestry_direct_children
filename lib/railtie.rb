require 'rails'

class RakeGem::Railtie < Rails::Railtie
  railtie_name :ancestry_direct_children
  rake_tasks do
    load 'tasks/populate.rake' 
  end

end
