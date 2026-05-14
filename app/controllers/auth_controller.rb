class AuthController < ApplicationController
  def callback
    token_data = {
      refresh_token: request.env['omniauth.auth']['credentials']['refresh_token'],
      access_token: request.env['omniauth.auth']['credentials']['token']
    }

    # Sauvegarde le token dans tmp/
    File.write(YoutubeService::TOKEN_PATH, token_data.to_json)

    redirect_to root_path, notice: "✅ YouTube connecté avec succès !"

end
  end
end
