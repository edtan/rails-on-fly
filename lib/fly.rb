class Fly
  def self.database_url
    primary = ENV["PRIMARY_REGION"]
    current = ENV["FLY_REGION"]
    db_url = ENV["DATABASE_URL"]

    if primary.blank? || current.blank? || primary == current
      return db_url
    end

    u = URI.parse(db_url)
    u.hostname = "#{current}.#{u.hostname}"
    u.port = 5433

    return u.to_s
  end

  def self.redis_url
    region = ENV["FLY_REGION"]
    redis_app_name = ENV["REDIS_APP_NAME"]
    return "redis://#{region}.#{redis_app_name}.internal:6379"
  end
end
