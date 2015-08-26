module MigrationHelpers
  UNIQUE_INDEX_SUFFIX = '_UNIQUE'
  FOREIGN_KEY_PREFIX  = 'fk_'

  def add_unique_index(table_name, column_name)
    add_index(table_name, column_name, :unique => true, :name => unique_index_name(column_name))
  end

  def remove_unique_index(table_name, column_name)
    remove_index(table_name, :name => unique_index_name(column_name))
  end

  def unique_index_name(column_name)
    if column_name.is_a? Symbol
      column_name.to_s.concat(UNIQUE_INDEX_SUFFIX)
    elsif column_name.is_a? Array
      column_name.map { |col| col.to_s }.join('_').concat(UNIQUE_INDEX_SUFFIX)
    end
  end

  def drop_foreign_key(child_table, parent_table, foreign_key_number = '1')
    foreign_key_name = default_foreign_key_name(child_table, parent_table, foreign_key_number)
    execute "ALTER TABLE `#{child_table}` DROP FOREIGN KEY `#{foreign_key_name}`"
  end

  # @deprecated Use default_foreign_key_name
  def foreign_key_name(child_table, parent_table, foreign_key_number = '1')
    "#{FOREIGN_KEY_PREFIX}#{child_table}_#{parent_table}#{foreign_key_number}"
  end

  # Cannot use the method name 'foreign_key_name' as it collides with the one in ActiveRecord 4.2
  def default_foreign_key_name(child_table, parent_table, foreign_key_number = '1')
    "#{FOREIGN_KEY_PREFIX}#{child_table}_#{parent_table}#{foreign_key_number}"
  end
end