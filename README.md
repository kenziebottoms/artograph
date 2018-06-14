# Artograph

![](https://img.shields.io/badge/data-postgres-316391.svg)
![](https://img.shields.io/badge/data-instagram-cc006c.svg)
![](https://img.shields.io/badge/node-v9.11.1-61BC62.svg)
![](https://img.shields.io/badge/css-bootstrap-5F2C7C.svg)
![](https://img.shields.io/badge/css_preprocessor-sass-DC4497.svg)
![](https://img.shields.io/badge/lodash-v4.17.10-3554FF.svg)
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
- `heroku pg:backups:restore 'https://github.com/kenziebottoms/artograph/blob/master/server/db/export.sql?raw=true' DATABASE_URL`: reset production Heroku database to `export.sql`
- `heroku pg:backups:capture`: back up production database
- `heroku pg:backups:download`: download production database backup

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
      - [`GET /insta/:username`](#get-instausername)
  - [Authentication](#authentication)
  - [Artists](#artists)
      - [`GET /artists`](#get-artists)
      - [`POST /artists`](#post-artists)
      - [`GET /artists/:id`](#get-artistsid)
      - [`PATCH /artists/:id`](#patch-artistsid)
      - [`GET /artists/tagged/:tag`](#get-artiststaggedtag)
      - [`GET /artists/nearby?lat=:lat&lng=:lng&allowance=:allowance`](#get-artistsnearbylatlatlnglngallowanceallowance)
  - [Tags](#tags)
      - [`GET /tags`](#get-tags)
      - [`POST /tags`](#post-tags)
      - [`GET /tags/:id`](#get-tagsid)
      - [`GET /artists/:id/tags`](#get-artistsidtags)
      - [`GET /tags/like/:q`](#get-tagslikeq)
      - [`GET /tags/matching/:q`](#get-tagsmatchingq)
  - [Users](#users)
      - [`GET /user`](#get-user)
  - [Favorites](#favorites)
      - [`GET /user/:id/faves`](#get-useridfaves)
      - [`GET /user/faves`](#get-userfaves)
      - [`POST /user/faves/:artistId`](#post-userfavesartistid)
      - [`DELETE /user/faves/:artistId`](#delete-userfavesartistid)
- [Angular Routes](#angular-routes)

<!-- /TOC -->
---

## Goals
- [x] Users can search a list of artists by
    - [x] name,
    - [x] tags,
    - [x] region name.
- [x] User can select their current location and receive a filterable list of tattoo artists ordered by distance from that point.
- [x] User can enter in tattoo artist information for other users to browse.
- [x] Users can add tags to artists that other users can search by.
- [x] Users can mark artists as their favorites.
- [x] User can filter and search on their favorites.

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

---

# API Endpoints (all preceded by `/api/v1`)

## Instagram scraping

#### `GET /insta/:username`

Returns metadata on the given user scraped from Instagram, and a 4-post feed with image and post links.

## Authentication

| Path | Method | Result |
| ---- | ------ | ------ |
| `/register` | `POST` | Register |
| `/login` | `POST` | Login |
| `/logout` | `POST` | Logout |

## Artists

#### `GET /artists`

Returns a list of all artists.

| Query string | Effect |
| ------------ | ------ |
| [none] | Sorts artists by `id`. |
| `sort=alpha` | Sorts artists alphabetically by last name. |
| `lat=:lat&lng=:lng` | Sorts artists by distance from `[lat, lng]`. |

_Note_: `lat` and `lng` will be ignored if they are not valid numbers.

#### `POST /artists`

Checks for an existing artist with the given `email`; if not found, validates data, and adds new artist. Returns `409: Conflict` if there is a duplicate and `400: Bad Request` if the data doesn't validate (for example, if `lng`/`lat` aren't numbers).

#### `GET /artists/:id`

Returns one artist by `id`.

#### `PATCH /artists/:id`

Updates the artist with the given `id` without overwriting unaddressed properties.

#### `GET /artists/tagged/:tag`

Returns a list of all artists associated with the given tag.

| Query string | Effect |
| ------------ | ------ |
| [none] | Sorts artists by `id`. |
| `sort=alpha` | Sorts artists alphabetically by last name. |
| `lat=:lat&lng=:lng` | Sorts artists by distance from `[lat, lng]`. |

#### `GET /artists/nearby?lat=:lat&lng=:lng&allowance=:allowance`

Returns a list of artists within an `allowance` by `allowance` latitude/longitude point square of the given `[lat, lng]`. `lat`, `lng`, and `allowance` are all required and this endpoint will return `400: Bad Request` if they are invalid or not supplied.

## Tags

#### `GET /tags`

Returns a list of all tags.

#### `POST /tags`

Checks for an existing tag with the given `name`; if not found, validates data, and adds new tag. Returns `409: Conflict` if there is a duplicate and `400: Bad Request` if the data doesn't validate (for example, if there's no `name` property in the request body).

#### `GET /tags/:id`

Returns one tag by `id`.

#### `GET /artists/:id/tags`

Returns a list of the tags associated with the provided artist.

#### `GET /tags/like/:q`

Returns a list of tags whose titles contain `q` (case-insensitive).

#### `GET /tags/matching/:q`

Returns a list of tags whose titles match `q` (case-insensitive).

## Users

#### `GET /user`

Returns the currently authenticated user. Returns `{ user: null }` if there isn't one.

## Favorites

#### `GET /user/:id/faves`

Returns the `id`s of the given user's favorite artists.

| Query string | Effect |
| ------------ | ------ |
| `verbose=true` | Returns the full artist object for each favorite. |

#### `GET /user/faves`

Returns the `id`s of the currently authenticated user's favorite artists. Returns `401: Unauthorized` if no one's logged in.

| Query string | Effect |
| ------------ | ------ |
| `verbose=true` | Returns the full artist object for each favorite. |

#### `POST /user/faves/:artistId`

Adds the `artistId` as a favorite to the currently authenticated user. Returns `401: Unauthorized` if no one's logged in.

#### `DELETE /user/faves/:artistId`

Removes the `artistId` from the currently authenticated user's favorites. Returns `401: Unauthorized` if no one's logged in.

---

# Angular Routes

| Path | Description |
| ---- | ----------- |
| `/#!/` | Homepage |
| `/#!/new` | Add new artist form |
| `/#!/faves` | Authenticated user's faves |
| `/#!/tags/:tag` | Artists listed with the given tag |
| `/#!/edit/:id` | Edit artist form |
| `/#!/login` | Login form |
| `/#!/register` | Registration form |