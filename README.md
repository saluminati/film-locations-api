## Film-Locations
By Salman Sohail

API built using Rails which gives the locations where movie(s) have been filmed.

> It supports San Francisco at the moment


### Installation

> Please change the database credentials in the **config/database.yml** with your database credentials.

```
$ bundle install
```

1) Load the database schema
```
$ rails db:setup
```


2) seed the database
```
$ rails db:seed
```
3) geocode the landmarks (this step will take some time)
```
rake geocode:all CLASS=ShootingLocation
```
4) instantiate the server
```
rails server -p 3001
```

### Usage:

## Find shooting locations
**GET /v1/shooting_locations**

**possible params:**
city, release_year, movie

Examples:

**get all the shooting locations of a specific movie**
```
get v1/shooting_locations,
		params: {filter: {city: 'SF',movie: 'Some movie'}}

v1/shooting_locations?filter[city]=SF&filter[movie]=Some movie

```

**get all the shooting locations in SF for the year 2017**
```
get v1/shooting_locations,
		params: {filter: {city: 'SF', release_year: 2017}}

v1/shooting_locations?filter[city]=SF&filter[release_year]=2017

```

**get all the shooting locations in SF since 1900**
```
get v1/shooting_locations,
		params: {filter: {city: 'SF'}}

v1/shooting_locations?filter[city]=SF
```


## Get movies list
**GET /v1/movies**

**params:**
city

Examples:

**get all the movies filmed in the given city**
```
get v1/movies,
		params: {filter: {city: 'SF}}

v1/shooting_locations?filter[city]=SF

```
