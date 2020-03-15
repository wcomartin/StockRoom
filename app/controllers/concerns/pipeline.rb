class Pipe
    
end

class Pipeline
    def initialize(user, request)
        @user = user
        @request = request
        @context = null
    end
end

class PipelineBuilder
    def initialize()
        @pipes = []
    end

    def use(pipe)
        @pipes.push pipe
    end

    def dispatch(user, request)
        context = Pipeline.new user, request
        execute_pipeline(@pipes, context)
    end

    def execute_pipeline(pipes, context)
        pipe = pipes[0]

        pipe.execute context, do 
            if (pipes.length > 1)
                execute_pipeline(pipes.drop(1), context)
    end
end