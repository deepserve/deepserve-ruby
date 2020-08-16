require "graphql/client"
require "graphql/client/http"

class Deepserve::GraphqlApi

    Connection = GraphQL::Client::HTTP.new("http://localhost:3000/graphql") do
      def headers(context)
        # Optionally set any HTTP headers
        { "X-DEEPSERVE-API-TOKEN": context[:api_key] }
      end
    end


    # However, it's smart to dump this to a JSON file and load from disk
    #
    # Run it from a script or rake task
    #   GraphQL::Client.dump_schema(SWAPI::HTTP, "path/to/schema.json")
    #
    # Schema = GraphQL::Client.load_schema("path/to/schema.json")
    Schema = GraphQL::Client.load_schema(Connection)

    Client = GraphQL::Client.new(schema: Schema, execute: Connection)

    Queries = Client.parse(<<-'GRAPHQL')
      query GetProjects {
        projects {
          id
          name
          description
          permalink
          username
          permalink
          username
        }
      }
    GRAPHQL



    Mutations = Deepserve::GraphqlApi::Client.parse(<<-'GRAPHQL')
      mutation Predict($input: PredictInput!) {
        predict(input: $input) {
          inference {
            durationMs
            source
            inputStrategy
            outputStrategy
            input
            output
            createdAt
            errorCode
            error
          }
        }
      }
    GRAPHQL

  def self.projects
    response = Client.query(Queries::GetProjects, {
      variables: {},
      context: {
        api_key: Deepserve.api_key
      }
    })

    response.data.projects
  end


  def self.predict(permalink, data)
    puts "predict"
    puts permalink
    puts data

    response = Client.query(Mutations::Predict, {
      variables: {
        input: {
          permalink: permalink,
          payload: data
        }
      },
      context: {
        api_key: Deepserve.api_key
      }
    })

    response.data.predict.inference
  end
end
