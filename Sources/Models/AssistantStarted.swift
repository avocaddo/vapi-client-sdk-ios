import Foundation

public struct AssistantStarted: Codable {
    public let newAssistant: Assistant?

    public struct Assistant: Codable {
        public let id: String?
        public let orgId: String?
        public let name: String?
        public let createdAt: String?
        public let updatedAt: String?
        public let firstMessage: String?
        public let voicemailMessage: String?
        public let endCallMessage: String?

        // Nested structures can be added as needed
        // For now, using generic dictionaries for complex nested objects
        // to avoid parsing errors from optional/variable fields
    }

    // Custom decoder to be lenient with additional fields
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        newAssistant = try container.decodeIfPresent(Assistant.self, forKey: .newAssistant)
    }

    private enum CodingKeys: String, CodingKey {
        case newAssistant
        case type
    }
}
