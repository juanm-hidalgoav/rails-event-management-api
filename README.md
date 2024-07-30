# Event Management API

## Overview

The Event Management API is a RESTful service built with Ruby on Rails, designed to manage events. The API supports user registration, authentication, and CRUD operations on events. Users can create, view, update, and delete their own events after authenticating.

## Features

* **User Authentication:** Register and log in users.
* **Event Management:** Create, read, update, and delete events.
* **JWT Authentication:** Secure API endpoints with JSON Web Tokens.

## Getting Started

### Prerequisites
* **Ruby:** Version 3.0.0 or higher
* **Rails:** Version 6.1 or higher

### Installation

1. Clone the Repository:

```bash
git clone https://github.com/juanm-hidalgoav/rails-event-management-api.git
cd rails-event-management-api
```

2. Install Dependencies:

```bash
bundle install
```

3. Set Up the Database: Create and migrate the database.

```bash
rails db:create
rails db:migrate
```

4. Run the Server: Start the Rails server.

```bash
rails s
```

## API Documentation

### Base URL

```javascript
http://localhost:3000/
```

### Endpoints

#### User Authentication
* ***Register: POST /register***
* ***Login: POST /login***

#### Events
* ***Get All Events: GET /events***
* ***Get Event by ID: GET /events/:id***
* ***Create Event: POST /events***
* ***Update Event: PUT /events/:id***
* ***Delete Event: DELETE /events/:id***

### Request & Response Examples

***Register*** 

> POST /register

* ***Request:***

```json

{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

* ***Response***

```json

{
  "user": {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com",
    "created_at": "2024-07-30T00:00:00.000Z",
    "updated_at": "2024-07-30T00:00:00.000Z"
  }
}
```

***Login***

> POST /login

* ***Request:***

```json
{
  "email": "john@example.com",
  "password": "password"
}
```

* ***Response:***

```json
{
  "token": "jwt_token_here"
}
```

***Create Event***

> POST /events

* ***Headers:*** *Authorization:* Bearer jwt_token_here

* ***Request:***

```json
{
  "name": "New Event",
  "description": "Event description",
  "date": "2024-08-01T10:00:00.000Z",
  "location": "Event location"
}
```
* ***Response:***

```json
{
  "id": 1,
  "name": "New Event",
  "description": "Event description",
  "date": "2024-08-01T10:00:00.000Z",
  "location": "Event location",
  "user_id": 1
}
```

***Get All Events***

> GET /events

* ***Headers:*** *Authorization:* Bearer jwt_token_here

***Get Event by ID***

> GET /events/:id

* ***Headers:*** *Authorization:* Bearer jwt_token_here

***Update Event***

> PUT/events/:id

* ***Headers:*** *Authorization:* Bearer jwt_token_here

* ***Request:*** (Include only the fields you want to update)

```json
{
  "name": "Event 605",
  "date": "2024-09-11T15:30:00.000Z",
}
```

***Delete Event***

> DELETE /events/:id

* ***Headers:*** *Authorization:* Bearer jwt_token_here

### Testing

Run the test suite to ensure everything is working as expected:
```bash
rails test
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Contact
For any inquiries, please contact juanm.hidalgoav@gmail.com