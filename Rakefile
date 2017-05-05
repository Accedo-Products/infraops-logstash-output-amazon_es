# frozen_string_literal: true

require 'bundler/gem_tasks'

require 'logstash/devutils/rake'

Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end
def remove_task(task_name)
  Rake.application.remove_task(task_name)
end
remove_task :release # So we don't publish to rubygems.org
