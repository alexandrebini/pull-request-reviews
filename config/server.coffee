module.exports =
  drawRoutes: (app) ->
    app.get '/api/pull_requests', (request, response) ->
      response.json([
        { id: 1, name: 'The first of many #1', files_changed: 2 }
      ])

    app.get '/api/pull_requests/1', (request, response) ->
      response.json([
        { id: 1, name: 'The first of many #1', files_changed: 2 }
      ])



# file.rb
#   hasMany: lines

# line.rb
#   file_id
#   text
#   hasMany: reviews
#   hasMany: discussions

# review.rb
#   revisor_id
#   type

# discussion.rb
#   belogsTo: revisor_id
#   message

# revisor.rb
#   uid
#   gravatar
#   name
#   email