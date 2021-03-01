
enum APIError: Error {
    case failedRequest
    case unexpectedDataFormat
    case failedResponse(APIResponseErrorData?)
    case failedURLCreation
    case failedAuthentication
}
