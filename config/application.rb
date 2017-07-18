require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HyperloopRails51Example
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # 取消了 hyperloop 的 auto_config feature, 所以, 下面我们不得不手动的设定一些必须的配置.
    config.hyperloop.auto_config = false

    # 手动指定 eager load 我们的 models 和 operations 目录
    # 注意我们省略了修改 autoload_paths 数组, 因为这个数组总是包含 eager_load_paths 的内容.
    config.eager_load_paths += %W(#{config.root}/app/hyperloop/models)
    config.eager_load_paths += %W(#{config.root}/app/hyperloop/operations)
    config.eager_load_paths += %W(#{config.root}/app/hyperloop/stores)

    # TODO: 似乎 components 不需要 eager load ?

    config.assets.paths << ::Rails.root.join('app', 'hyperloop').to_s
    config.assets.paths << ::Rails.root.join('app', 'hyperloop', 'models').to_s

    config.eager_load_paths -= %W(#{config.root}/app/hyperloop)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
