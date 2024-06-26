class ApiSizeLimit < ActiveRecord::Migration[7.1]
  def up
    safety_assured do
      execute DatabaseFunctions::API_SIZE_LIMIT
    end
  end

  def down
    safety_assured do
      execute "DROP FUNCTION api_size_limit(bigint)"
    end
  end
end
