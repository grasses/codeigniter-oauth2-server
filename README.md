# CodeIgniter OAuth2 Server

------------------------

CodeIgniter OAuth2 Server, a CodeIgniter package for OAuth2.0 Server,

For OAuth2.0: [http://oauth.net/2/](http://oauth.net/2/)

Learn OAuth2.0 protocol: [http://bshaffer.github.io/oauth2-server-php-docs/overview/grant-types/](http://bshaffer.github.io/oauth2-server-php-docs/overview/grant-types/)

Also for Chinese guide : [http://homeway.me/2015/06/29/build-oauth2-under-codeigniter/](http://homeway.me/2015/06/29/build-oauth2-under-codeigniter/)

For test result: [http://oauth2.homeway.me/oauth/test](http://oauth2.homeway.me/oauth/test)

# Installation

------------------------

1.Clone pakcage

> git clone https://github.com/grasses/codeigniter-oauth2-server

2.Config database -> $db['oauth']

> cd codeigniter-oauth2-server

> vim application/config/database.php

3.Import database

> mysqldump -u root -p > sql/oauth.sql



# Features

------------------------

* Support for: `Password Credentials`, `Client Credentials`, `Implicit Grant`, `Authorization Code` grant types.

* Refresh access token

* From access token get resource data

* Support for Mysql, Redis, Mongo


