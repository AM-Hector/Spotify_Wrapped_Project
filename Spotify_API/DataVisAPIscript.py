
# Python Script to interact with Spotify API

import requests

SPOTIFY_CREATE_PLAYLIST_URL = ''
ACCESS_TOKEN = ''

def create_playlist(name, public):
    response = requests.post(
        SPOTIFY_CREATE_PLAYLIST_URL, 
        headers={
            "Authorization": f"Bearer {ACCESS_TOKEN}"
        },
        json={
            "name": name;
            "public": public
        }
    )
    json_resp = response.json()

    return json_resp    

    

def main():
    playlist = create_playlist(
        name="History 2016", 
        public=False
    )

    print(f"Playlist: {playlist}")

if __name__ == '__main__':
    main()    
