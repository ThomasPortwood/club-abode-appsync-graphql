resource "aws_appsync_graphql_api" "club-abode-appsync-graphql" {
  authentication_type = "API_KEY"
  name                = "club-abode-graphql"

  schema = <<EOF
schema {
    query: Query
    mutation: Mutation
    subscription: Subscription
}

type Mutation {
    addPost(id: ID! author: String! title: String content: String url: String): Post!
    updatePost(id: ID! author: String! title: String content: String url: String ups: Int! downs: Int! expectedVersion: Int!): Post!
    deletePost(id: ID!): Post!
}

type Post {
    id: ID!
    author: String!
    title: String
    content: String
    url: String
    ups: Int
    downs: Int
    version: Int!
}

type Query {
    allPost: [Post]
    getPost(id: ID!): Post
}

type Subscription {
    newPost: Post
    @aws_subscribe(mutations:["addPost"])
}
EOF
}
