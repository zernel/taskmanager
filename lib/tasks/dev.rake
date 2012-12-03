namespace :dev do
  namespace :db do
    desc "Rebuild the system"
    task :reset => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed", "db:test:prepare" ]
  end

  namespace :cache do
    desc "Clear the cache"
    task :clear => :environment do
      Rails.cache.clear
    end
  end
end
