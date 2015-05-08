##Cuba-Flash

Cuba Flash provides flash messages to Cuba apps.

###Install

```
gem install cuba-flash
```

### Usage

```Ruby
require "cuba"
require "cuba/flash"

Cuba.use Rack::Session::Cookie, :secret => "super secret key"
Cuba.use Cuba::Flash

Cuba.define do
  on get, root do
    flash[:info] = "Flash message"
    
    res.write flash[:info]
  end
end
```
