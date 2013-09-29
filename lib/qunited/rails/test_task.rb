module QUnited
  module Rails
    class TestTask < ::Rake::TaskLib
      include ::Rake::DSL if defined?(::Rake::DSL)

      TMP_DIR_NAME = 'qunited-compiled-js'

      # Name of task.
      #
      # default:
      #   :qunited
      attr_accessor :name

      # Array or strings specifying logical paths of Assets. These will be
      # loaded in order if specified as an array.
      attr_writer :source_paths

      # Array or glob pattern of QUnit test files. These will be loaded in order if specified as an array.
      attr_accessor :test_files

      # Array or glob pattern of test helper files. These include extra libraries for mocks or other
      # test tools. These are loaded after source files and before test files. These will be loaded
      # in order if specified as an array.
      attr_accessor :helper_files

      # Array or glob pattern of fixture files. These are included under the #qunit-fixture element
      # on the test page. These will be included in order if specified as an array.
      attr_accessor :fixture_files

      # The driver to use to run the QUnit tests.
      attr_accessor :driver

      # Use verbose output. If this is true, the task will print the QUnited command to stdout.
      #
      # default:
      #   true
      attr_accessor :verbose

      # Fail rake task when tests fail.
      #
      # default:
      #   true
      attr_accessor :fail_on_test_failure

      # The port to use if running the server.
      #
      # default:
      #   3040
      attr_accessor :server_port

      def initialize(*args)
        @name = args.shift || :qunited
        @verbose = true
        @fail_on_test_failure = true
        @server_port = nil

        yield self if block_given?

        desc('Run QUnit JavaScript tests') unless ::Rake.application.last_comment
        task(@name => :environment) do
          internal_task_name = "qunited-rails-#{@name}"
          QUnited::RakeTask.new(internal_task_name) do |t|
            create_tmp_dir

            compiled_source_files = []
            source_paths.each do |path|
              compiled_source_files << compile_and_write_tmp_file(path)
            end

            t.source_files = compiled_source_files
            %w[test_files helper_files fixture_files driver verbose fail_on_test_failure server_port].each do |a|
              t.send("#{a}=", send(a))
            end
          end

          Rake::Task[internal_task_name].invoke
        end
      end

      private

      def create_tmp_dir
        tmp_path = "./tmp/#{TMP_DIR_NAME}"
        Dir.mkdir tmp_path unless File.directory?(tmp_path)
      end

      def compile_and_write_tmp_file(logical_path)
        filename = "./tmp/#{TMP_DIR_NAME}/#{logical_path}"
        File.open(filename, 'w') do |f|
          f.write(::Rails.application.assets.find_asset(logical_path).to_s)
        end
        filename
      end

      def source_paths
        Array(@source_paths)
      end
    end
  end
end
