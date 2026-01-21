import Foundation

public struct StatusUpdate: Codable {
    public let status: String
    
    // Custom decoder to ignore all extra fields like newAssistant
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Only decode status, ignore everything else
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? ""
    }
    
    // Custom encoder
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(status, forKey: .status)
    }
    
    private enum CodingKeys: String, CodingKey {
        case status
        case type // This is in the JSON but we don't need it
    }
}