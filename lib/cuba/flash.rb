class Cuba
  class FlashHash < Hash
    def [](key)
      delete(key)
    end
  end

  class Flash
    def initialize(app, opts = {})
      @app, @opts = app, opts
    end

    def call(env)
      env['rack.session']['cuba.flash'] ||= FlashHash.new

      @app.call(env)
    end
  end

  def flash
    env['rack.session']['cuba.flash'] ||= FlashHash.new
  end
end
