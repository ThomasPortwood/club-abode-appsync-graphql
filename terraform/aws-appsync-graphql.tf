resource "aws_appsync_graphql" "club-abode-appsync-graphql" {
  authentication_type = "API_KEY"
  name                = "club-abode-graphql"

  schema = <<EOF
schema {
    query: Query
}
type Query {
  test: Int
}
EOF
}
