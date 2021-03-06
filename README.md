## Hackathon - Ping Pong Bracket (Team Brit)

> Create an account and pit yourself against the world's greatest ping pong aficionados.

- Create & View Tournaments
- Add Players
- Seed Bracket Rounds
- Track Losses
- Leader Boards 

> [https://hackathon-team-brit.herokuapp.com](https://hackathon-team-brit.herokuapp.com)

## Table of Contents

- [General Usage](#general-usage) (THIS IS IMPORTANT)
  * [Authorization](#authorization)
  * [Errors](#errors)
  * [Parameters](#parameters)
- [Routes](#routes)
  * [User Accounts](#user-accounts)
  * [Players](#players)
  * [Running Tournaments](#running-tournaments)
  * [Viewing Tournaments and Results](#viewing-tournaments-and-results)

## General Usage

### Authorization

All requests that need authorization are noted in the README by
a `(!)` before the route address.

Users are assigned a token during account creation and that must be
sent in the headers as "**Access-Token**" to make authenticated requests.
A user's access token may be retrieved at any time via the "/login" route.

Attempt to access an authenticated route without supplying the access token
will return a **401 Unauthenticated** status code.

### Errors

Any request that fails to be processed will return an *appropriate*
status code as a response as well as a JSON object with an "errors"
property providing any additional data to solve the problem.

### Parameters

**All** parameters are expected to be sent in JSON format.
All parameters are **required** unless explicitly marked as `(optional)`.

## Routes

### User Accounts

#### POST /signup

> This route creates an account for a new user.

**Params:**

* first_name: string
* last_name: string
* username: string
* email: string
* password: string

**Status Code:**
Returns 201 Created on Success and 422 Unprocessable Entity in case of failure.

**Request:**

```
{
  "first_name": "Brit",
  "last_name": "Butler",
  "username": "KingCons",
  "email": "brit@lies.com",
  "password": "cookies"
}
```

**Response:**

```
{
  "user": {
    "id": 35,
    "first_name": "Brit",
    "last_name": "Butler",
    "username": "KingCons",
    "email": "brit@lies.com",
    "access_token": "7774743beeb3c26dfdd80213ba1b9097"
  }
}
```

#### POST /login

> This route signs a user in and returns their account info.

**Params:**

* username: string
* password: string

**Status Codes:**
Returns 200 on success and 401 on failure.

**Request:**

```
{
  "username": "KingCons",
  "password": "cookies"
}
```

**Response:**

```
{
  "access_token": "7774743beeb3c26dfdd80213ba1b9097",
  "username": "KingCons"
}
```

### Players

#### (!) POST /players

> Create a new player.

**Params:**

* fullname: string
* nickname: string (must be unique)
* location: string (optional)

**Status Codes:**
Returns 201 Created on success, 422 Unprocessable Entity in case of failure.

**Request:**

```
{
  "fullname": "Terry Robinson",
  "nickname": "The Champ",
  "location": "Atlanta, GA"
}
```

**Response:**

```
{
  "id": 13,
  "fullname": "Terry Robinson",
  "nickname": "The Champ",
  "location": "Atlanta, GA",
  "created_at": "July 28, 2016 ...",
}
```

#### GET /players

> Retrieve a list of players ordered by username.

**Params:**

* page: number (optional, defaults to 1)
* per_page: number (optional, defaults to 25)

**Response Code:**
Returns 200 OK on success.

**Response:**

```
{
  "players": [
    {
      "id": 13,
      "fullname": "Terry Robinson",
      "nickname": "The Champ",
      "location": "Atlanta, GA",
      "created_at": "July 28, 2016 ...",
      "updated_at": "July 28, 2016 ..."
    },
    { ... },
    { ... }
  ],
  "page_info": "Displaying players 6 - 10 of 26 in total"
}
```

#### GET /players/:nickname

> Retrieve a player by nickname. Remember that nicknames are unique.

**Params:**
None

**Status Codes:**
Returns 200 OK on success, 404 Not Found on failure.

**Response:**
Same as for creating a player.

### Running Tournaments

#### (!) POST /tournaments

> Create a new tournament.

**Params:**

* title: string
* size: integer (one of 4,8,12,16,20,24,28,32)
* location: string (optional)
* deadline: datetime (optional)
* starting_at: datetime (optional)

**Status Codes:**
Returns 201 Created on success, and 422 Unprocessable entity on failure.

**Request:**

```
{
  "title": "Table Tennis Terror",
  "size": 16,
  "location": "The Iron Yard"
}
```

**Response:**

```
{
  "id": 42,
  "title": "Table Tennis Terror",
  "size": 16,
  "location": "The Iron Yard",
  "deadline": null,
  "starting_at": null,
  "organizer": "KingCons"
}
```

#### (!) POST /tournaments/:tournament_id/add-player

> Add a player to a tournament.

**Params:**

* player_id:integer

**Status Codes:**
Returns 201 Created on success, 422 Unprocessable Entity on failure.

**Request:**

```
{
  "player_id": 13
}
```

**Response:**

```
{
  "id": 13,
  "fullname": "Terry Robinson",
  "nickname": "The Champ",
  "location": "Atlanta, GA",
  "created_at": "July 28, 2016 ...",
}
```

#### POST /tournaments/:id/seed

> Seed the starting round with random player matchups.

**Params:**
None

**Status Codes:**
Returns 201 Created on success, 422 Unprocessable Entity if the tournament has already been seeded.

**Response:**

```
{
  matches: [
    {
      "id": 7,
      "p1_score": 0,
      "p2_score": 0,
      "live": false,
      "page_id": 2,
      "winner_id": null,
      "player1": { ... },
      "player2": { ... }
    },
    { ... },
    { ... }
  ]
}
```

#### PUT /tournaments/:tournament_id/matches/:id

> Update match scores, winners, and liveness.

**Params:**

* p1_score: integer
* p2_score: integer
* winner_id: integer
* live: boolean

**Status Codes:**
Returns 200 OK on success, failure is impossible.

**Response:**

```
{
  "id": 7,
  "p1_score": 0,
  "p2_score": 0,
  "live": false,
  "page_id": 2,
  "winner_id": null,
  "updated_at": "2016-10-04 ....",
  "player1": { ... },
  "player2": { ... },
  "tournament_id": 34
}
```

### Viewing Tournaments and Results

#### GET /tournaments

> Get a list of tournaments in reverse chronological order.

**Params:**

* page: number (optional, defaults to 1)
* per_page: number (optional, defaults to 25)

**Response Code:**
Returns 200 OK on success.

**Response:**

```
{
  "tournaments": [
    {
      "id": 42,
      "title": "Table Tennis Terror",
      "size": 16,
      "location": "The Iron Yard",
      "deadline": null,
      "starting_at": null,
      "created_at": "July 28, 2016 ...",
      "organizer": "KingCons"
    },
    { ... },
    { ... }
  ],
  "page_info": "Displaying tournaments 6 - 10 of 26 in total"
}
```

#### GET /tournaments/:id

> View a specific tournament and its players.

**Params:**
None

**Response Code:**
Returns 200 OK on success.

**Response:**

```
{
  "id": 42,
  "title": "Table Tennis Terror",
  "size": 16,
  "location": "The Iron Yard",
  "deadline": null,
  "starting_at": null,
  "organizer": "KingCons"
  "players": [
    {id, fullname, nickname, etc etc},
    { },
    ...
  ]
}
```
