class CreateTravels::V20230623201458 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Travel) do
      primary_key id : Int64
      add_timestamps
      add travel_stops : Array(Int32)
    end
  end

  def rollback
    drop table_for(Travel)
  end
end
