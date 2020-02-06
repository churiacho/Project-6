CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider:                   'AWS',
        aws_access_key_id:          'AKIA4JTBOULHBTJRWROT',
        aws_secret_access_key:      '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',
        region:                     'ca-central-1'
    }

    config.fog_directory    = 'moveandgroove'
    config.fog_public       = false
    config.fog_attributes   = { cache_control: "public, max-age=#{365.days.to_i}" }
end