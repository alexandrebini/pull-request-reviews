module.exports =
  readJSONFile: (filename, callback) ->
    require('fs').readFile filename, (err, data) ->
      if err
        callback(err)
        return
      try
        callback null, JSON.parse(data)
      catch exception
        callback exception

  drawRoutes: (app) ->
    app.get '/api/users', (request, response) =>
      @readJSONFile 'config/api/users.json', (error, json) ->
        throw error if error
        response.json json

    app.get '/api/users/current', (request, response) =>
      systemUser = process.env['USER']
      @readJSONFile 'config/api/users.json', (error, json) ->
        throw error if error
        currentUser = json[Math.floor(Math.random() * json.length)]
        for user in json
          if user.name.indexOf(systemUser) != -1 || user.email.indexOf(systemUser) != -1
            currentUser = user
        response.json currentUser

    app.get '/api/pull_requests', (request, response) =>
      @readJSONFile 'config/api/pull_requests.json', (error, json) ->
        throw error if error
        response.json json

    app.get '/api/pull_requests/:id', (request, response) =>
      @readJSONFile "config/api/pull_requests_#{ request.params.id }.json", (error, json) ->
        throw error if error
        response.json json

    app.get '/api/repositories', (request, response) =>
      @readJSONFile 'config/api/repositories.json', (error, json) ->
        throw error if error
        response.json json

    app.get '/api/repositories/:id', (request, response) =>
      @readJSONFile "config/api/repositories_#{ request.params.id }.json", (error, json) ->
        throw error if error
        response.json json