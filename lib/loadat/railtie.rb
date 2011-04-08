require 'loadat'
require 'rails'
module Loadat
	class Railtie < Rails::Railtie
		rake_tasks do
			load 'tasks/loadat.rake'
		end
	end
end
