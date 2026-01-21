import Foundation

public struct StatusUpdate: Codable {
    public struct Assistant: Codable {
        // Add all the fields that might appear, but make them optional
        public let variableValues: [String: AnyCodable]?
        
        // Use CodingKeys to ignore unknown fields
        private enum CodingKeys: String, CodingKey {
            case variableValues
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            variableValues = try container.decodeIfPresent([String: AnyCodable].self, forKey: .variableValues)
        }
    }
    
    public let status: String
    public let newAssistant: Assistant?
    
    private enum CodingKeys: String, CodingKey {
        case status
        case newAssistant
    }
}
