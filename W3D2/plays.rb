require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Playwright
  attr_accessor :id, :name, :year

  def initialize(args)
    @id = args['id']
    @name = args['name']
    @year = args['year']
  end

  def all
    
  end

  def find_by_name(name)
    individual = PlayDBConnection.instance.execute(<<-SQL, name
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL
  end

  def create

  end

  def update
    PlayDBConnection.instance.execute(<<-SQL, name, year, id)
      UPDATE
        playwrights
      SET
        name = ?, year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays

  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def find_by_title(title)

  end

  def find_by_playwright(name)

  end

  

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end
