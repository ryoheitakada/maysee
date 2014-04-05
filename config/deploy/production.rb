# config/deploy/production.rb
# -*- coding: utf-8 -*-

# チェックアウトするブランチ名を指定する
set :branch, 'master'
set :rails_env, 'production'

# アプリケーションデプロイ先のベースディレクトリの絶対パスを記述する
set :deploy_to, '/var/www/maysee/'

# Your HTTP server, Apache/etc
role :web, "54.238.59.147"
# This may be the same as your `Web` server
role :app, "54.238.59.147"
# This is where Rails migrations will run
# rake db:migrateを実行するサーバーのホスト名を指定する
# データベースサーバーのホスト名になるわけではないので注意
role :db,  "54.238.59.147", primary: true

