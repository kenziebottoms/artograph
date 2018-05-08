# Artograph

An app to geographically visualize and organize tattoo artist information.

> ### `car·to·graph`
>
> `/ˈkɑr tə ˌgræf/`, noun
>
> an illustrated map

## Goals
- [x] Users can search a list of artists by
    - [x] name,
    - [x] tags,
    - [x] region name.
- [x] User can select their current location and receive a filterable list of tattoo artists ordered by distance from that point.
- [x] User can enter in tattoo artist information for other users to browse.
- [x] Users can add tags to artists that other users can search by.

### Stretch Goals
- [ ] Users can up- and downvote others’ tags.
- [ ] Users can look up an Instagram account and the app will try and guess/scrape the artist’s information and location.
- [x] App will scrape instagram to show recent tattoos.
- [x] App will automatically geolocate user.
- [x] App will reverse-geocode latitude and longitude and infer a region name.

## Tech
- [Geolocation](https://developer.mozilla.org/en-US/docs/Web/API/Geolocation), MDN
- [Google Maps Javascript API](https://developers.google.com/maps/documentation/javascript/)
    - [Marker clustering](https://developers.google.com/maps/documentation/javascript/marker-clustering)
    - [(Reverse) geocoding](https://developers.google.com/maps/documentation/geocoding/intro#ReverseGeocoding)
- [Sequelize](http://docs.sequelizejs.com/)
- [Sass](http://sass-lang.com/)

## Links
- [Previous front-end-only attempt](https://github.com/kenziebottoms/inkmap)
- [Instagram scraping practice](https://github.com/kenziebottoms/scram)
- [Trello board](https://trello.com/b/5q1GtVnF/inkmap)

# Node Endpoints

## Instagram scraping

#### `GET /insta/meta/:username`

Returns metadata on the given user scraped from Instagram.

#### `GET /insta/posts/:username`

Returns an object with the 4 most recent posts from Instagram. Returns an image link and a post link.

## Authentication

| Path | Method | Result |
| ---- | ------ | ------ |
| `/register` | `POST` | Register |
| `/login` | `POST` | Login |
| `/logout` | `POST` | Logout |

## Artist search

#### `GET /artists?lat=:lat&lng=:lng`

_Note_: `lat` and `lng` are optional and will be ignored if they are not valid numbers.

Returns a list of artist sorted by their geometric distance from the given `[lat, lng]`. If either query parameter is invalid or not supplied, artists are returned in alphabetical order by last name.

#### `GET /artists/:id`

Returns one artist by `id`.

#### `GET /artists/nearby?lat=:lat&lng=:lng&allowance=:allowance`

Returns a list of artists within an `allowance` by `allowance` latitude/longitude point square of the given `[lat, lng]`.

## Tags

#### `GET /artists/:id/tags`

Returns a list of the tags with their `id`s associated with the provided artist.

#### `GET /tags`

Returns a list of all tags.

#### `GET /tags/like/:q`

Returns a list of tags that have a title containing `q` (case insensitive).

#### `GET /tags/match/:q`

Returns a list of tags whose titles match `q` (case insensitive).

#### `POST /tags`

Checks for an existing tag with the given `name`; if not found, validates data, and adds new tag. Returns `409: Conflict` if there is a duplicate and `400: Bad Request` if the data doesn't validate (for example, if there's no `name` property in the request body).

## Artist transformation

#### `POST /artists`

Checks for an existing artist with the given `email`; if not found, validates data, and adds new artist. Returns `409: Conflict` if there is a duplicate and `400: Bad Request` if the data doesn't validate (for example, if `lng`/`lat` aren't numbers).

#### `PATCH /artists/:id`

Updates the artist with the given `id` without overwriting unaddressed properties.

# Angular Routes

| Path | Description |
| ---- | ----------- |
| `/#!/` | Homepage |
| `/#!/new` | Add new artist form |