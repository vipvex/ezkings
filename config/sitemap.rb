# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://ezkings-vipvex.c9users.io/"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  
  add marketplace_path, :priority => 1, :changefreq => 'daily'
  add marketplace_search_path, :priority => 1, :changefreq => 'daily'
  
  Page.find_each do |page|
     add page.url, :lastmod => page.updated_at
  end
  
  
  Checklist.find_each do |checklist|
     add checklist.url, :lastmod => checklist.updated_at
  end
  
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end