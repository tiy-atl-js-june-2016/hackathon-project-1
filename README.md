## Hackathon - Ping Pong Bracket (Team Brit)

> Create an account and pit yourself against the world's greatest ping pong aficionados.

- Create & View Tournaments
- Add Players
- Seed Bracket Rounds
- Track Losses
- Leader Boards 

> [https://hackathon-team-brit.herokuapp.com](https://hackathon-team-brit.herokuapp.com)

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

### Routes

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

### Running Tournaments

#### (!) POST /tournaments

> Create a new tournament.

**Params:**
* title: string
* size: integer (one of 4,8,12,16,20,24,28,32)
* location: string (optional)
* deadline: datetime (optional)

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
  "deadline": null
  "organizer": "KingCons"
}
```

### Viewing Tournaments and Results
