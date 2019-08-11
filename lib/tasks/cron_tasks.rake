require "byebug"

namespace :cron_tasks do
  desc "task for expiring invites and purging users"
  task expire_invites_and_purging_users: :environment do
    # if last_requested_at older than 7 days then update status in FR table

    sql_query = "SELECT * FROM friending_db.friend_requests;"
    results = ActiveRecord::Base.connection.execute(sql_query)
    ids_dates_diff_gr_7 = []

    results.each do |result|
        id = result[0]
        last_requested_at = result[6]
        dates_diff = (Time.now().to_date - last_requested_at.to_date).to_i
        ids_dates_diff_gr_7.push(id) if dates_diff >= 7
    end

    # set status to expired in friend requests table
    # status 1 represents expired request
    sql_query_status_update = "UPDATE friending_db.friend_requests SET status=1 WHERE id IN ("+ids_dates_diff_gr_7.join(",")+");"
    ActiveRecord::Base.connection.execute(sql_query_status_update)
    puts sql_query_status_update

  end
end
