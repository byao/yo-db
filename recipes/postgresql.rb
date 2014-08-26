
include_recipe 'postgresql'
include_recipe 'postgresql::server'
include_recipe 'database::postgresql'

connection_defaults = {
  'host' => 'localhost',
  'port' => node['postgresql']['config']['port'],
  'username' => 'postgres',
  'password' => node['postgresql']['password']['postgres']
}

postgresql_connection_info = connection_defaults.merge! node['postgresql']['connection_info'] || {}

databases = Array(node['postgresql']['databases'])
users = Array(node['postgresql']['users'])

users.each do |user|
  postgresql_database_user user['username'] do
    connection postgresql_connection_info
    password user['password'] || node['postgresql']['password']['postgres']
    action :create
  end
end

databases.each do |db|
  postgresql_database db['name'] do
    connection postgresql_connection_info
    template          db['template'] || 'DEFAULT'
    encoding          db['encoding'] || 'utf8'
    tablespace        db['tablespace'] || 'DEFAULT'
    connection_limit  db['connection_limit'] || '-1'
    owner             db['owner'] || 'postgresql'
    action :create
  end
end
