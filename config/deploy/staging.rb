server 'alav.chost.com.ua', user: 'deploy', roles: %w{app db web}
set :deploy_to, '/var/www/alav/data/www/staging.offers.kiev.ua'
set :rails_env, 'staging'
