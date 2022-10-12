# frozen_string_literal: true

module ResponseHelpers
  def generate_responses!
    after(:example) do |example|
      next if response.status == 204

      content = example.metadata[:response][:content] || {}
      example_spec = {
        "application/json" => {
          examples: {
            default: {
              value: JSON.parse(response.body, symbolize_names: true)
            }
          }
        }
      }
      example.metadata[:response][:content] = content.deep_merge(example_spec)
    end
  end
end

RSpec.configure do |c|
  c.extend ResponseHelpers
end
