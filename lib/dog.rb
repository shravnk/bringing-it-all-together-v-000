class Dog

attr_accessor :name, :breed
attr_reader :id

def initialize(id:nil, name:, breed:)
  @id = id
  @name = name
  @breed = breed
end

def self.create_table
  sql = "CREATE TABLE IF NOT EXISTS dogs (id INTEGER PRIMARY KEY, name TEXT, grade TEXT)"

  DB[:conn].execute(sql)
end

def self.drop_table
  sql = "DROP TABLE IF EXISTS dogs"
  DB[:conn].execute(sql)
end

def self.new_from_db(attr)
  dog = self.new(attr[0],attr[1], attr[2])
  dog
end

def self.find_by_name(name)
  sql = <<-SQL
    SELECT * FROM dogs
    WHERE name = ?
    LIMIT 1
  SQL

  row = DB[:conn].execute(sql, name).first
end

def self.create

end

def update
  sql = <<-SQL
    UPDATE dogs
    SET name = ?, breed = ?
    WHERE id = ?
  SQL

  DB[:conn].execute(sql, self.name, self.breed, self.id)
end

def save
  if self.id
    self.update
    return self
  else
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES (?,?)
    SQL
    dog = DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute(sql,"SELECT last_insert_rowid() FROM students")[0][0]
  end
end

end
