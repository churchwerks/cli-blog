class Post
  attr_accessor :id, :title, :body
  @@all = []

  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS posts (
      id INTEGER PRIMARY KEY,
      title VARCHAR(255),
      body TEXT
    )


    SQL
  end
  def save
    @@all << self
    self.id = @@all.size
  end

  def self.all
    @@all
  end

  def self.find_by_id(id)
    self.all.detect{|p| p.id == id.to_i}
  end

end
