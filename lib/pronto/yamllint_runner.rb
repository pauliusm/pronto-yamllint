require 'pronto'
require 'shellwords'

module Pronto
  # runner for yamllint
  class YAMLLintRunner < Runner
    def yamllint_opts
      ENV['YAMLLINT_OPTS']
    end

    def run
      return [] if !@patches || @patches.count.zero?

      @patches
        .select { |patch| patch.additions > 0 && yaml?(patch.new_file_full_path) }
        .map { |patch| inspect(patch) }
        .flatten.compact
    end

    private

    def yaml?(path)
      path.to_s.end_with?('.yaml', 'yml')
    end

    def git_repo_path
      @git_repo_path ||= Rugged::Repository.discover(File.expand_path(Dir.pwd)).workdir
    end

    def inspect(patch)
      line_numbers = offending_line_numbers(patch)[0]
      lines = offending_line_numbers(patch)[1]
      line_numbers.map do |line_number|
        patch
          .added_lines
          .select { |line| line.new_lineno == line_number }
          .map { |line| new_message(lines[line_number], line) }
      end
    end

    def new_message(offence, line)
      path = line.patch.delta.new_file[:path]
      level = if offence.include?('[error]')
                :error
              else
                :warning
              end

      Message.new(path, line, level, offence, nil, self.class)
    end

    def offending_line_numbers(patch)
      line_numbers = []
      lines = []

      Dir.chdir(git_repo_path) do
        escaped_file_path = Shellwords.escape(patch.new_file_full_path.to_s)

        output = `yamllint -f parsable #{yamllint_opts} #{escaped_file_path}`
        output.split("\n").each do |l|
          line_number = l.split(':')[1].to_i
          line_numbers << line_number
          lines[line_number] = l.split(patch.new_file_full_path.to_s + ':')[1]
        end

        [line_numbers, lines]
      end
    end
  end
end
