Class Dog

attr_accessor :name, :breed
attr_reader :id

def initialize(id:=nil, name:, breed:)
  @id = id 
  @name = name
  @breed = breed
end

def self.create_table
  sql = "CREATE TABLE IF NOT EXISTS dogs(id INTEGER PRIMARY KEY, name TEXT, grade TEXT"

  DB[:conn].execute(sql)  
end

def 

end