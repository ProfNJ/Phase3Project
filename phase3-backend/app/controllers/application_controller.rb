class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'

    get "/" do
    end

    get "/test" do
        {hello: "testing"}.to_json
    end
end