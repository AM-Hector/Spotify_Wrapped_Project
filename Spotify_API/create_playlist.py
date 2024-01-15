import requests

SPOTIFY_CREATE_PLAYLIST_URL = ''
ACCESS_TOKEN = ''

# making the playlist function for each year
def create_playlist(name, public):
    response = requests.post(
        SPOTIFY_CREATE_PLAYLIST_URL,
        headers={
            "Authorization": f"Bearer {ACCESS_TOKEN}"
        },
        json={
            "name": name,
            "public": public
        }
    )
    json_resp = response.json()

    return json_resp

# ?? another function for calling the create_playlist function
def main():
    playlist = create_playlist(
        name="History2016",
        public=False
    )

    print(f"Playlist: {playlist}")


if __name__ == '__main__':
    main()

# got to create a function for adding tracks to a playlist
