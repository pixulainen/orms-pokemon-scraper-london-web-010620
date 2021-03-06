class Pokemon
    attr_reader :id, :name, :type, :db

    def initialize (id:,name:,type:,db:) 
        @id = id
        @name = name
        @type = type
        @db = db
    end
    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
    end
    def self.find(id,db)
      pokemon_by_id = db.execute("select * from pokemon where id = ?", id)
      self.new(id: pokemon_by_id[0][0],name: pokemon_by_id[0][1],type: pokemon_by_id[0][2],db:db)
    end
end
