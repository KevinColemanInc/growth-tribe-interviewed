Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/:id', to: 'trees#show'
  get '/:id/parent/:parent_id', to: 'trees#parent'
  get '/:id/child/:child_id', to: 'trees#child'
end
