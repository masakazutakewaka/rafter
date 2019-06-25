describe 'database' do
  before(:all) do
    Rails.application.load_tasks
  end

  it 'overrides database tasks' do
    overridden = %w(db:setup db:test:load)
    overridden.each do |o|
      pre_tasks = Rake::Task[o].prerequisite_tasks
      expect(pre_tasks).to satisfy do |tasks|
        tasks.any? { |t| t.name == 'db:schema:ridgepole:apply' }
      end
    end
  end
end
