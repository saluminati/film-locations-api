class CreateJoinTableMovieActor < ActiveRecord::Migration[5.0]
  def change
    create_join_table :movies, :actors do |t|
       t.index [:movie_id, :actor_id], unique: true
      # t.index [:actor_id, :movie_id]
    end
  end
end
