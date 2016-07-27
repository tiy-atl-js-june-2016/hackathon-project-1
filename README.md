## Hackathon - Team Brit

## Authorization

All authorized requests unless otherwise mentioned require
a "**Access-Token**" header to be present. Users are assigned an
Auth Token during account creation. The access token can be
retrieved at any time via the "/login" route.

#### Errors

Any request that fails to be processed will return an *appropriate*
status code as a response as well as a JSON object with an "errors"
property providing any additional data to solve the problem.

### Routes

#### POST /signup

> This route creates an account for a new user.

**Params:**

```
  * first_name: string
  * last_name: string
  * username: string
  * email: string
  * password: string
```

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

> This route exists 'signs a user in' and gets their info.

**Params:**

```
username: string
password: string
```

**Status Codes:**
Returns 200 on success and 401 on failure.

***Request:***

```
{
  "username": "KingCons",
  "password": "cookies"
}
```

***Response:***

```
{
  "access_token": "7774743beeb3c26dfdd80213ba1b9097",
  "username": "KingCons"
}
```
