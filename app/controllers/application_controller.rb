class ApplicationController < ActionController::API

    def authenticate_token
        p "AUTHENTICATE JWT"
        render json: { status: 401, message: 'Unauthorized'} unless decode_token(bearer_token)
    end

    def bearer_token 
        p "BEARER TOKEN"
        header = request.env["HTTP_AUTHORIZATION"]
        pattern = /^Bearer /
        puts header.gsub(pattern, '') if header && header.match(pattern)
        header.gsub(pattern, '') if header && header.match(pattern)
    end

    def decode_token(token_input)
        p "DECODE TOKEN, token input: #{token_input}"
        p token = JWT.decode(token_input, ENV['JWT_SECRET'], true, { :algorithm => 'HS256'})
        render json: { decoded: token }
    end

end
