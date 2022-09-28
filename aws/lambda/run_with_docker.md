docker run --rm -v "$PWD":/var/task --mount type=tmpfs,target=/dev/shm,readonly=true lambci/lambda:ruby2.7 lambda_function.lambda_handler
