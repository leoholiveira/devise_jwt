
# Ruby on Rails JSON API Project with Devise and JWT Authentication

This project is a Ruby on Rails JSON API that leverages the Devise framework for authentication and JWT (JSON Web Token) for secure user authentication.

## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`DB_USER`
`DB_PASS`
`DB_HOST`
`DB_PORT`
`DB_NAME`

## Environment Setup

Ensure you have Ruby and Rails installed on your system. Install project dependencies using the following command:

```bash
  bundle install
```

Additionally, configure the database by running the following commands:

```bash
  rails db:create
  rails db:migrate
```

## Set up devise-jwt

devise-jwt will handle token dispatch and authentication, which doesn’t come with devise out of the box.

JWTs need to be created with a secret key that is private. It shouldn’t be revealed to the public. When we receive a JWT from the client, we can verify it with that secret key stored on the server.

We can generate a secret by typing the following in the terminal:

```bash
bundle exec rake secret
```

We will then add it to the encrypted credentials file so it won’t be exposed:

```bash
#VSCode 
EDITOR='code --wait' rails credentials:edit
```

Then we add a new key: value in the encrypted .yml file.

```
# Other secrets...  
# Used as the base secret for Devise-JWT 
devise_jwt_secret_key: (copy and paste the generated secret here)
```

## Testing with Postman:

In our application terminal, run `rails s` to start the server.

### Creating user:

```http
  POST http://localhost:3001/users
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `username` | `string` | **Required** |
| `email` | `string` | **Required** |
| `birthdate` | `date` | **Required** |
| `ddd` | `integer` | **Required** |
| `phone` | `integer` | **Required** |
| `document` | `string` | **Required** |
| `password` | `string` | **Required** |
| `password_confirmation` | `string` | **Required** |

#### Usage/Example:

```json
{
	"user": {
		"username": "John Martins",
		"email": "test@test.com",
		"birthdate": "10/10/1990",
		"ddd": "11",
		"phone": "951515151",
		"document": "77743779211",
		"password": "12345678",
		"password_confirmation": "12345678"
	}
}
```

#### Response:

```json
{
	"success": true,
	"user": {
		"id": "6163fc4d-c04c-4ff6-b589-078292584c0f",
		"email": "test@test.com",
		"username": "John Martins",
		"birthdate": "1990-10-10",
		"ddd": 11,
		"phone": 951515151,
		"document": "77743779211",
		"created_at": "2024-01-16T00:33:20.299Z",
		"updated_at": "2024-01-16T01:15:02.336Z"
	},
	"active": false,
	"message": "active your email."
}
```

## API Endpoints

#### User Registration:

```http
POST /users: Creates a new user.
```

#### Login:

```http
POST /users/sign_in: Initiates user session.
```

#### Logout:

```http
DELETE /users/sign_out: Ends user session.
```

#### User Profile:

```http
GET /users/edit: Retrieves user profile information.
```

#### Profile Update:

```http
PUT /users: Updates user profile information.
```

## Contributions

Contributions are always welcome!

Feel free to contribute to this project. Fork it, create a branch for your feature or bug fix, and submit a pull request.

Please adhere to this project's `code of conduct`.

## Support

For support, email contatos_leo@hotmail.com.

## Tech Stack

**Client:** JSON API. 

**Server:** Ruby, JWT, Rspec.

## License

This project is licensed under the [MIT License](https://choosealicense.com/licenses/mit/).

## Authors

- [@leoholiveira](https://github.com/leoholiveira)