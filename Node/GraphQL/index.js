var express = require('express')
var graphQLHTTP = require('express-graphql')
var g = require('graphql')

var app = express()

var PersonType = new g.GraphQLObjectType({
  name: 'Person',
  description: 'Some person...',

  fields: {
    name: { type: g.GraphQLString },
    age: { type: g.GraphQLString }
  }
})

var QueryType = new g.GraphQLObjectType({
  name: 'Query',
  description: '...',

  fields: {
    person: {
      type: PersonType,
      args: {
        id: {
          type: g.GraphQLString
        },

        resolve: function () {
          return 'Ardi Vaba'
        }
      }
    }
  }
})

app.use(graphQLHTTP({
  QueryType,
  graphiql: true
}))

console.log('Starting server...')
app.listen(8000)
console.log('Server ended...')
