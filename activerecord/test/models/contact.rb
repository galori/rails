class Contact < ActiveRecord::Base
  def self.columns
    @columns
  end

  # mock out self.columns so no pesky db is needed for these tests
  def self.column(name, sql_type = nil, options = {})
    @columns ||= []
    @columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, options[:default], sql_type.to_s, options[:null])
  end

  column :name,        :string
  column :age,         :integer
  column :avatar,      :binary
  column :created_at,  :datetime
  column :awesome,     :boolean
  column :preferences, :string

  serialize :preferences

  belongs_to :alternative, :class_name => 'Contact'
end
