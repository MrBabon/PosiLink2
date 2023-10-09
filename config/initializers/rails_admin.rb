RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    unless current_user.admin?
      flash[:alert] = "Désolé, pas d'accès administrateur pour vous."
      redirect_to main_app.root_path
    end
  end

  ## == Pundit ==
  # config.authorize_with :pundit

  config.model 'Organization' do
    edit do
      field :name
      field :category do
        formatted_value do
          bindings[:object].category_form_value
        end
      end
      field :email
      field :address
      field :phone
      field :description
      # field :avatar do
      #   pretty_value do
      #     if bindings[:object].avatar.attached?
      #       image_tag bindings[:object].avatar.service_url
      #     else
      #       "Aucune image"
      #     end
      #   end
      #   formatted_value do
      #     bindings[:view].tag(:img, { src: bindings[:object].avatar.service_url, style: "max-width: 100px; max-height: 100px;" }) if bindings[:object].avatar.attached?
      #   end
      # end
      field :avatar, :active_storage
    end
  end
  

  ## == CancanCan ==
  # config.authorize_with :cancancan


  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
