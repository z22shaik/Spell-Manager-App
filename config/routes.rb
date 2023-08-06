Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: 'static_pages#home'
    resources :books
    resources :spells
  
    get '/books/:id/spell_add', to: 'books#spell_add', as: 'book_spell_add' 
 get '/spells/:id/spell_add', to: 'spells#spell_add', as: 'spell_spell_add' 
 patch '/spells/:id/spell_add', to: 'spells#spell_create', as: 'spell_spell_create' 
 patch '/books/:id/spells/:spell_id/spell_add', to: 'books#spell_create', as: 'book_spell_create' 




  
    
    
    patch 'books/:id/:spell_id/remove_spell', to: 'books#remove_spell', as: 'book_remove_spell'
end
