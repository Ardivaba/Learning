require("graphql")

PersonType = GraphQL::ObjectType.define do
  name "Person"
  description "..."

  field :firstName, !types.String, property: :first_name
  field :lastName, !types.String, property: :last_name
  field :email, !types.String
  field :username, !types.String
  field :id, !types.String

  field :friends do
    type -> { types[PersonType] }
    resolve -> (person, args, ctx) { person.friends }
  end
end

QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "..."

  field :person do
    type PersonType
    argument :id, !types.string
    resolve -> (root, args, ctx) { "Hi" }
  end
end

Schema = GraphQL::Schema.new(
  query: QueryType
)
