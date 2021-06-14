class Addreferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :studios, :user, foreign_key: true
    add_reference :bookings, :user, foreign_key: true
  end
end
