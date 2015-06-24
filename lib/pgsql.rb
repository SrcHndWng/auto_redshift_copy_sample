require 'pg'
require 'settings'

module AutoRedshiftCopySample
  class Pgsql
    def exec(sql)
      con = PG::connect(
          host: Settings.pgsql.host,
          user: Settings.pgsql.user,
          password: Settings.pgsql.password,
          dbname: Settings.pgsql.dbname,
          port: Settings.pgsql.port
      )

      con.transaction do |con|
        con.exec(sql)
      end
    rescue => e
      raise e
    ensure
      con.finish
    end
  end
end