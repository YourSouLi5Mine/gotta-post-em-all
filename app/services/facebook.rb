class Facebook
  class << self
    def fbgraph(token)
      Koala::Facebook::API.new(token)
    end

    def publish(page_token, content, image_key)
      if image_key
        fbgraph(page_token).put_picture(s3_url(image_key), {message: content})
      else
        fbgraph(page_token).put_connections('me', 'feed', message: content)
      end
    end

    private
    def s3_url(image_key)
      "https://#{ENV["BUCKET"]}.s3-#{ENV["SERVER"]}.amazonaws.com/#{image_key}"
    end
  end
end
