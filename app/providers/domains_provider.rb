require 'fog'

class DomainsProvider
  requires :credentials

  def value
    options = {
      :rackspace_username  => credentials.username,
      :rackspace_api_key   => credentials.api_key,
      :rackspace_region    => credentials.rackspace_region,
      :connection_options => {:headers => {"User-Agent" => "rumm/#{Rumm::VERSION} fog/#{Fog::VERSION}"}}
    }
    Fog::DNS::Rackspace.new(options).zones
  end
end
