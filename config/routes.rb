Rails.application.routes.draw do
  mount Hyperloop::Engine => '/hyperloop'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#helloworld'
  get '/greeter' => 'home#meeter_greeter'
  # 下面的代码演示了, 如何使用自己的路由.
  get '/table' => 'hyperloop#stylish_table'
  get '/offer_lucky_dip' => 'hyperloop#offer_lucky_dip'
  get '/offer_lucky_dip_dispatcher' => 'hyperloop#offer_lucky_dip_dispatcher'
  get '/share_a_store' => 'hyperloop#share_a_store'
  get '/booklist' => 'hyperloop#book_list'
  get '/player' => 'hyperloop#player'
end
