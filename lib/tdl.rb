class Tdl
  class << self
    def parse_and_save(file_path)
      file = File.open(file_path)
      doc = Nokogiri::XML::Document.parse(file) do |config|
        config.noblanks
      end

      save_todos(doc.children)
    end

    private

      def save_todos(nodes, parent_node = nil)
        nodes.each do |node|
          save_todo(node, parent_node)
          if node.children.count > 0
            save_todos(node.children, node)
          end
        end
      end

      def save_todo(node, parent_node = nil)
        return unless node.name.eql?('TASK')

        todo = Todo.find_or_initialize_by_id(node.attributes['ID'].value)
        todo.id = node.attributes['ID'].value
        todo.title = node.attributes['TITLE'].value
        todo.completed_at = parse_date(node.attributes['DONEDATE'].try(:value))
        todo.created_at = parse_date(node.attributes['CREATIONDATE'].try(:value))
        todo.updated_at = parse_date(node.attributes['LASTMOD'].try(:value))
        todo.parent_id = parent_node.try(:attributes).try(:[], 'ID').try(:value)
        todo.todo_category = category(node)

        todo.save!
      end

      def category(node)
        name = node.at_xpath(".//CATEGORY").try(:text)

        if name.nil?
          return nil
        else
          category = TodoCategory.find_by_name(name)
          if category.nil?
            category = TodoCategory.new(:name => name)
            category.save!
          end

          return category
        end
      end

      def parse_date(date)
        return nil if date.blank?

        Time.at((date.to_f - 25569).days).utc
      end
  end
end

