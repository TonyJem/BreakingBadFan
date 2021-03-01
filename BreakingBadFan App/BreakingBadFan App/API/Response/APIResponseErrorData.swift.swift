struct APIResponseErrorData: Decodable {

    let userIdErrors: [String]?
    let cityIdErrors: [String]?
    let typeErrors: [String]?
    let latitudeErrors: [String]?
    let longitudeErrors: [String]?
    let addressErrors: [String]?
    let violationDateErrors: [String]?
    let problemDescriptionErrors: [String]?

    enum CodingKeys: String, CodingKey {
        case userIdErrors = "user_id"
        case cityIdErrors = "city_id"
        case typeErrors
        case latitudeErrors
        case longitudeErrors
        case addressErrors
        case violationDateErrors = "violation_date_time"
        case problemDescriptionErrors = "description"
    }
}
