Description
===========

Simple Chef cookbook that wraps [database](https://github.com/opscode-cookbooks/database) cookbook to simplify create actions. Instead of writing custom wrapper cookbook for database actions, this cookbook takes configuration instead and its recipe uses database providers

Supported databases:

* [postgresql](https://github.com/hw-cookbooks/postgresql)

Supported actions:

* create user
* create database

Requirements
------------
Chef version 0.11+

### Platforms
* Debian, Ubuntu
* Red Hat, CentOS, Scientific, Fedora, Amazon

### Cookbooks
The following Opscode cookbooks are dependencies:

* postgresql
* database

Attributes
----------

#### yo-db::postgresql

* `node['postgresql']['connection_info']` - (Hash) postgresql connection information: host, port, username, password
* `node['postgresql']['users']` - (Array) Array of hashes containing new user: username, password
* `node['postgresql']['databases']` - (Array) Array of hashes containing new database options: name, encoding, template, tablespace, collation, connection_limit, owner

Usage
-----

#### yo-db::postgresql
Include yo-db::postgresql as a recipe and provide json configuration

```ruby
{
  ...

  'postgresql' => {
    ...
    'connection_info' => {
      'host' => 'localhost',
      'port' => '5432',
      'username' => 'postgres',
      'password' => 'postgres'
    },
    'users' => [
      {
        'username' => 'dbuser'
        'password' => 'supersecret'
      }
    ],
    'databases' => [
      {
        'name' => "#{APPLICATION_NAME}_development",
        'owner' => 'dbuser',
        'encoding' => 'utf8',
        'template' => 'template1'
        'tablespace' => 'DEFAULT' 
        'collation' => 'DEFAULT'
        'connection_limit' => '-1'
      }
    ]
  }
}
```

Todo
----

* Add support for different databases
* Add support for more actions

Contributing
------------

1. Fork the repository
1. Submit a Pull Request

License and Authors
-------------------
* Author:: Bob Yao (<bobbyyao@gmail.com>)
