class YouTubeService
      TOKEN_PATH = Rails.root.join(ENV["YOUTUBE_FILE_TOKEN"])
 
   def initialize
      @client = Google::Auth::UserRefreshCredentials.new(
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      scope: 'https://www.googleapis.com/auth/youtube.upload',
      redirect_uri: 'http://localhost:3000/auth/google_oauth2/callback'
    )

    # Charge le token sauvegardé
    if File.exist?(TOKEN_PATH)
      token_data = JSON.parse(File.read(TOKEN_PATH))
      @client.refresh_token = token_data['refresh_token']
      @client.fetch_access_token!
    end
   @service = Google::Apis::YoutubeV3::YouTubeService.new
    @service.authorization = @client
  end
  def upload_video(title:,description:,)
   


end 

