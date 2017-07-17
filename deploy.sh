#!/bin/bash

export RAILS_SERVE_STATIC_FILES=true
export DATABASE_URL=postgresql://postgres:123456@127.0.0.1/whatever_yours_dbname
export RAILS_LOG_TO_STDOUT=true
export SECRET_KEY_BASE=2c598f60c782d5e20a23d1a7900a09b39662f33a6993a9d30ddc06f1acc9b1a39ac3cf29823d73a51d5698ceb622e9af56b70bf4740175d0a5ad4caa04a3593f
export RAILS_ENV=production
export RUBYOPT=
export RUBYLIB=

bin/rails assets:precompile

bin/rails s -b 0.0.0.0 -p 3000
