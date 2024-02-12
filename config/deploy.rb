require 'mina/multistage'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/whenever'
require 'httparty'

DISCORD_WEBHOOK_URL = Figaro.env.config_discrd_api.freeze

set :shared_files, fetch(:shared_files, []).push('config/database.yml', 'config/application.yml', 'config/secrets.yml')
set :deploy_to, '/var/www/api/om30_api'

set :shared_dirs, fetch(:shared_dirs, []).push(
  'log',
  'tmp',
  'public/uploads',
)

task :remote_environment do
  # For those using RVM, use this to load an RVM version@gemset.
  # invoke :'rvm:use', 'ruby-2.5.3@default'
end

def discord_content(content)
  HTTParty.post(
    DISCORD_WEBHOOK_URL,
    headers: { "Content-Type" => "application/json" },
    body: { "content": content }.to_json
)
end

task :setup do
  command %{rvm install ruby-3.1.0}
  command %{rvm use ruby-3.1.0@om30_api --create}

  command %{touch "#{fetch(:deploy_to)}/config/secrets.yml"}

  command %(  mkdir -p "#{fetch(:deploy_to)}/shared/tmp"  )
  command %(  chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/tmp"  )

  command %(  mkdir -p "#{fetch(:deploy_to)}/shared/log"  )
  command %(  chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/log"  )

  command %(  mkdir -p "#{fetch(:deploy_to)}/shared/pids"  )
  command %(  chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/pids"  )

  command %(  mkdir -p "#{fetch(:deploy_to)}/shared/config"  )
  command %(  chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/config"  )

  command %(  touch "#{fetch(:deploy_to)}/shared/config/database.yml"  )
  command %(  echo "-----> Be sure to edit "shared/config/database.yml"."  )

  command %(  touch "#{fetch(:deploy_to)}/shared/config/application.yml"  )
  command %(  echo "-----> Be sure to edit "shared/config/application.yml"."  )

  command %(  mkdir -p "#{fetch(:deploy_to)}/shared/public/uploads"  )
  command %(  chmod g+rx,u+rwx "#{fetch(:deploy_to)}/shared/public/uploads"  )
end

desc "Deploys the current version to the server."


task :deploy do
  run :local do
    discord_content("@everyone **Deploy da API OM30 #{fetch(:environment).capitalize} iniciado** por #{ENV.fetch("USER")} a partir da branch #{fetch(:branch)}")
  end

  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'deploy:cleanup'

    on :launch do
      invoke :'whenever:update'
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
      end
    end
  end

  run :local do
    discord_content("@everyone **Deploy da API OM30 #{fetch(:environment).capitalize} finalizado** por #{ENV.fetch("USER")} a partir da branch #{fetch(:branch)}")
  end
end
