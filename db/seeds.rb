# encoding: utf-8

require_relative 'seeds/regions'    # rake db:seed:dump FILE=db/seeds/regions.rb MODELS=Region IMPORT=true EXCLUDE=created_at,updated_at
require_relative 'seeds/districts'  # rake db:seed:dump FILE=db/seeds/districts.rb MODELS=District IMPORT=true EXCLUDE=created_at,updated_at
require_relative 'seeds/localities' # rake db:seed:dump FILE=db/seeds/localities.rb MODELS=Locality IMPORT=true EXCLUDE=created_at,updated_at
require_relative 'seeds/metro_stations'
require_relative 'seeds/users'
require_relative 'seeds/agencies'   # rake db:seed:dump FILE=db/seeds/agencies.rb MODELS=Agency IMPORT=true EXCLUDE=created_at,updated_at
require_relative 'seeds/articles'   # rake db:seed:dump FILE=db/seeds/articles.rb MODELS=Article IMPORT=true EXCLUDE=id,created_at,updated_at
require_relative 'seeds/support'
require_relative 'seeds/offers'     # rake db:seed:dump FILE=db/seeds/offers.rb MODELS=Offer IMPORT=true EXCLUDE=created_at,updated_at
