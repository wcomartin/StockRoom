class AddProductController < ApplicationController
    def add_product
        user = null # TODO: get_request_user

        @pipeline = PipelineBuilder.new
        @pipeline.use(Setup.new)
        @pipeline.use(Authorization.new)
        @pipeline.use(Validation.new)
        @pipeline.use(DoWork.new)
        @pipeline.dispatch(user, params_object)
    end

    private def params_object
        params.require(:product).permit(:name, :description)
    end
end

class Context 

end

class Setup < Pipe
    def execute(pipeline, next)
        pipeline.context = Context.new
        next
    end
end

class Authorization < Pipe
    def execute(pipeline, next)
        # Check user permissions

        next
    end
end

class Validation < Pipe
    def execute
        if (pipeline.request[:name] == null){
            pipeline.errors.push(ResponseError.new "Name is a required parameter")
        }

        if (pipeline.request[:description] == null){
            pipeline.errors.push(ResponseError.new "Description is a required parameter")
        }

        next
    end
end

class DoWork < Pipe
    def execute
        @product = Product.new(pipeline.request)
        @product.save
        next
    end
end