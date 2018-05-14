# Artograph

![](https://img.shields.io/badge/data-postgres-blue.svg)
![](https://img.shields.io/badge/data-instagram-cc006c.svg)
![](https://img.shields.io/badge/modularity-node+express-61BC62.svg)
![](https://img.shields.io/badge/css_framework-bootstrap-5F2C7C.svg)
![](https://img.shields.io/badge/css_preprocessor-sass-DC4497.svg)
![](https://img.shields.io/badge/mvp-working-green.svg)
![](https://img.shields.io/badge/stretch-wip-yellow.svg)

An app to geographically visualize and organize tattoo artist information.

> ### `car·to·graph`
>
> `/ˈkɑr tə ˌgræf/`, noun
>
> an illustrated map

## Run Locally

```bash
git clone git@github.com:kenziebottoms/artograph.git
cd artograph
npm install
npm run db:reset
npm start
```

## Database ops

- `npm run db:regen`: generate database from `server/db/seeders`
- `npm run db:save`: save current database to `server/db/export.sql`
- `npm run db:reset`: reset database to last saved

---

<!-- TOC -->

- [Artograph](#artograph)
  - [Run Locally](#run-locally)
  - [Database ops](#database-ops)
  - [Goals](#goals)
    - [Stretch Goals](#stretch-goals)
  - [Tech](#tech)
  - [Links](#links)
- [API Endpoints (all preceded by `/api/v1`)](#api-endpoints-all-preceded-by-apiv1)
  - [Instagram scraping](#instagram-scraping)
      - [`GET /insta/meta/:username`](#get-instametausername)
      - [`GET /insta/posts/:username`](#get-instapostsusername)
  - [Authentication](#authentication)
  - [Artists](#artists)
      - [`GET /artists?lat=:lat&lng=:lng`](#get-artistslatlatlnglng)
      - [`GET /artists/:id`](#get-artistsid)
      - [`GET /artists/nearby?lat=:lat&lng=:lng&allowance=:allowance`](#get-artistsnearbylatlatlnglngallowanceallowance)
      - [`POST /artists`](#post-artists)
      - [`PATCH /artists/:id`](#patch-artistsid)
  - [Tags](#tags)
      - [`GET /artists/:id/tags`](#get-artistsidtags)
      - [`GET /tags`](#get-tags)
      - [`GET /tags/like/:q`](#get-tagslikeq)
      - [`GET /tags/match/:q`](#get-tagsmatchq)
      - [`POST /tags`](#post-tags)
  - [Users](#users)
      - [`GET /user`](#get-user)
  - [Favorites](#favorites)
      - [`GET /user/:id/faves`](#get-useridfaves)
        - [`&verbose=true`](#verbosetrue)
      - [`GET /user/faves`](#get-userfaves)
      - [`POST /user/faves/:artistId`](#post-userfavesartistid)
      - [`DELETE /user/faves/:artistId`](#delete-userfavesartistid)
- [Angular Routes](#angular-routes)

<!-- /TOC -->

## Goals
- [x] Users can search a list of artists by
    - [x] name,
    - [x] tags,
    - [x] region name.
- [x] User can select their current location and receive a filterable list of tattoo artists ordered by distance from that point.
- [x] User can enter in tattoo artist information for other users to browse.
- [x] Users can add tags to artists that other users can search by.
- [x] Users can mark artists as their favorites.
- [ ] User can filter and search on their favorites.

### Stretch Goals
- [x] App will automatically geolocate user.
- [x] App will scrape instagram to show recent tattoos.
- [x] App will reverse-geocode latitude and longitude and infer a region name.
- [x] Users can edit artist information and tags.
- [ ] Users can up- and downvote others’ tags.
- [ ] Users can look up an Instagram account and the app will try and guess/scrape the artist’s information and location.

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

# API Endpoints (all preceded by `/api/v1`)

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

## Artists

#### `GET /artists?lat=:lat&lng=:lng`

_Note_: `lat` and `lng` are optional and will be ignored if they are not valid numbers.

Returns a list of artist sorted by their geometric distance from the given `[lat, lng]`. If either query parameter is invalid or not supplied, artists are returned in alphabetical order by last name.

#### `GET /artists/:id`

Returns one artist by `id`.

#### `GET /artists/nearby?lat=:lat&lng=:lng&allowance=:allowance`

Returns a list of artists within an `allowance` by `allowance` latitude/longitude point square of the given `[lat, lng]`.

#### `POST /artists`

Checks for an existing artist with the given `email`; if not found, validates data, and adds new artist. Returns `409: Conflict` if there is a duplicate and `400: Bad Request` if the data doesn't validate (for example, if `lng`/`lat` aren't numbers).

#### `PATCH /artists/:id`

Updates the artist with the given `id` without overwriting unaddressed properties.

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

## Users

#### `GET /user`

Returns the currently authenticated user. Returns `401: Unauthorized` if there isn't one.

## Favorites

#### `GET /user/:id/faves`

Returns the `id`s of the given user's favorite artists.

##### `&verbose=true`

Returns full artist info for all the given user's favorite artists.

#### `GET /user/faves`

Returns the `id`s of the currently authenticated user's favorite artists. Returns `401: Unauthorized` if no one's logged in.

#### `POST /user/faves/:artistId`

Adds the `artistId` as a favorite to the currently authenticated user. Returns `401: Unauthorized` if no one's logged in.

#### `DELETE /user/faves/:artistId`

Removes the `artistId` from the currently authenticated user's favorites. Returns `401: Unauthorized` if no one's logged in.

# Angular Routes

| Path | Description |
| ---- | ----------- |
| `/#!/` | Homepage |
| `/#!/new` | Add new artist form |
| `/#!/edit/:id` | Edit artist form |
| `/#!/login` | Login form |
| `/#!/register` | Registration form |