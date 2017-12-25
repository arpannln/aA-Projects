require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    list = DBConnection.execute2(<<-SQL)
      SELECT 
        *
      FROM 
        #{self.table_name}
      LIMIT 
        0
    SQL
    @columns = list.first.map(&:to_sym)

    # list.map {|el| el.to_sym}
    
  end

  def self.finalize!
    columns.each do |col| 
      define_method(col) do 
        self.attributes[col]
      end

      define_method("#{col}=") do |value|
        self.attributes[col] = value 
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.underscore.pluralize 
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
    SQL

      
    parse_all(results)
        
  end

  def self.parse_all(results)
      results.map {|result| self.new(result)}
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
      SELECT 
        #{table_name}.*
      FROM 
        #{table_name}
      WHERE 
        #{table_name}.id = ? 
    SQL
    
    parse_all(results).first   
  end

  def initialize(params = {})
    params.each do |name, value| 
      name = name.to_sym 
      if self.class.columns.include?(name)
        self.send("#{name}=", value)
      else 
        raise "unknown attribute '#{name}'"
      end 
    end 
  end

  def attributes
    @attributes ||= {}
    @attributes 
  end

  def attribute_values
    self.class.columns.map { |name| self.send(name)}
    
  end

  def insert
    cols = self.class.columns.drop(1)
    col_names = cols.map(&:to_s).join(", ")
    questions = (["?"] * cols.count).join(", ")
    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO 
        #{self.class.table_name} (#{col_names})
      VALUES 
        (#{questions})
    SQL
    
    self.id = DBConnection.last_insert_row_id
  end


  def update
    set_line = self.class.columns
      .map { |attr| "#{attr} = ?" }.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end


  def save
    self.id.nil? ? insert : update
  end
end
