Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#prefijo, ruta, controlador, nombre link

get 'entries/new', to: 'entries#new', as: 'new_entries'
post 'entries', to: 'entries#create'
get 'entries/:id/edit', to: 'entries#edit', as: 'edit_entry'
patch 'entries/:id', to: 'entries#update', as: 'entry'
delete 'entries/:id', to: 'entries#destroy', as: 'delete_entry'

root 'entries#index'
end


