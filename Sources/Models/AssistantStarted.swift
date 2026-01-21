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

        // Custom decoder to ignore extra fields like voice, model, transcriber, etc.
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decodeIfPresent(String.self, forKey: .id)
            orgId = try container.decodeIfPresent(String.self, forKey: .orgId)
            name = try container.decodeIfPresent(String.self, forKey: .name)
            createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
            updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt)
            firstMessage = try container.decodeIfPresent(String.self, forKey: .firstMessage)
            voicemailMessage = try container.decodeIfPresent(String.self, forKey: .voicemailMessage)
            endCallMessage = try container.decodeIfPresent(String.self, forKey: .endCallMessage)
        }

        private enum CodingKeys: String, CodingKey {
            case id, orgId, name, createdAt, updatedAt, firstMessage, voicemailMessage, endCallMessage
        }
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
