CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAJLTOLADBS23IZDCQ',
      :aws_secret_access_key  => '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',
      :region                 => 'eu-central-1'
    }
    config.fog_directory = 'gbarillot-ynov-listings'
  end
end
