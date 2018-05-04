# Artograph

An app to geographically visualize and organize tattoo artist information.

> ### `car·to·graph`
>
> `/ˈkɑr tə ˌgræf/`, noun
>
> an illustrated map

## Goals
- [ ] Users can search a list of artists by
    - [x] name,
    - [ ] tags,
    - [ ] region name.
- [x] User can select their current location and receive a filterable list of tattoo artists ordered by distance from that point.
- [ ] User can enter in tattoo artist information for other users to browse.
- [ ] Users can add tags to artists that other users can search by.

### Stretch Goals
- [ ] Users can up- and downvote others’ tags.
- [ ] Users can look up an Instagram account and the app will try and guess/scrape the artist’s information and location.
- [ ] App will scrape instagram to show recent tattoos.
- [x] App will automatically geolocate user.

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

## Node Endpoints

### Instagram scraping

#### `GET /insta/meta/:username`

Returns metadata on the given user scraped from Instagram.

#### `GET /insta/posts/:username`

Returns an object with the 3 most recent posts from Instagram. Returns an image link and a post link.

### Authentication

| Path | Method | Result |
| ---- | ------ | ------ |
| `/register` | `POST` | Register |
| `/login` | `POST` | Login |
| `/logout` | `POST` | Logout |

### Artist search

#### `GET /artists?lat=:lat&lng=:lng`

_Note_: `lat` and `lng` are optional and will be ignored if they are not valid numbers.

Returns a list of artist sorted by their geometric distance from the given `[lat, lng]`. If either query parameter is invalid or not supplied, artists are returned in alphabetical order by last name.

#### `GET /artists/:id`

Returns one artist by `id`.

#### `GET /artists/nearby?lat=:lat&lng=:lng&allowance=:allowance`

Returns a list of artists within an `allowance` by `allowance` latitude/longitude point square of the given `[lat, lng]`.

### Tag search

#### `GET /artists/:id/tags`

Returns a list of the tags associated with the provided artist.

## Angular Routes

| Path | Description |
| ---- | ----------- |
| `/#!/` | Homepage |