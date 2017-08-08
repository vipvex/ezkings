class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = exception.message
    redirect_to root_url
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "EZ Kings Cards"
    title       = [controller_name, action_name].join(" ")
    description = "Buy LA Kings hockey cards online with EZ Kings. Find roockie cards. Shiping ontime."
    image       = options[:image] || "your-default-image-url"
    current_url = request.url
    reverse     = true

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[ez kings ezkings cards hokey buy lakings la los angeles collectible trading store marketplace],
      reverse:     reverse,
      twitter: {
        site_name: site_name,
        site: '@ezkings',
        card: 'summary',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
end
