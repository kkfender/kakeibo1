if Rails.env.production?
CarrierWave.configure do |config|
 config.fog_provider = 'fog/aws' # 追加
  config.fog_credentials = {
  provider: 'AWS',
  aws_access_key_id: 'AKIAIKMJ3JFEXXYCJHRA',
  aws_secret_access_key: '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',
  region: 'ap-northeast-1'
  }
  
  
  config.fog_directory  = 'rails-am05kk'
  config.fog_public     = false    
  #config.cache_storage = :fog
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  config.asset_host = "https://s3.ap-northeast-1.amazonaws.com/rails-am05kk"
config.storage :fog
end
end