require 'swagger_helper'

RSpec.describe 'api/my', type: :request do
  before do
    driven_by(:rack_test)
  end
end
