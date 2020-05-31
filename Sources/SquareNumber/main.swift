import AWSLambdaRuntime

struct Input: Codable {
  let number: Double
}

struct Output: Codable {
  let result: Double
}

#if DEBUG
try Lambda.withLocalServer {
  Lambda.run { (context, input: Input, callback) in
    callback(.success(Output(result: input.number * input.number)))
  }
}
#else
Lambda.run { (context, input: Input, callback) in
  callback(.success(Output(result: input.number * input.number)))
}
#endif
