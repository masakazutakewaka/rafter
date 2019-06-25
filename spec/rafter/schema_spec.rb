describe 'update the Schemafile by generating a model' do

  it 'should update the Schemafile' do
    expect(ActiveRecord::Generators::ModelGenerator).to satisfy do |klass|
      methods = klass.instance_methods
      methods.include?(:append_schema_file) && methods.none? { |m| m == :create_migration_file }
    end
  end
end
