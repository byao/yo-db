name             'yo-db'
maintainer       'Bob Yao'
maintainer_email 'bobbyyao@gmail.com'
license          'All rights reserved'
description      'Installs/Configures db. Wraps database cookbook to simplify database and user actions'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe            'yo-db', 'Includes yo-db::postgresql'
recipe            'yo-db::postgresql', 'Wraps database cookbook to perform db actions such as create db and create user'

depends           'postgresql', '>= 3.0.0'
depends           'database', '>= 2.0.0'
