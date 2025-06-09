import Foundation

public struct Message: Codable {
    public enum Role: String, Codable {
        case user = "user"
        case assistant = "assistant"
        case system = "system"
        case tool = "tool"
        case toolCalls = "tool_calls"
    }
    
    public struct ToolCall: Codable {
        public struct Function: Codable {
            public let name: String
            public let arguments: String
        }

        public let id: String
        public let type: String
        public let function: Function
    }

    public let role: Role
    public let content: String?
    public let toolCalls: [ToolCall]?
    public let toolCallId: String?

    private enum CodingKeys: String, CodingKey {
        case role
        case content
        case toolCalls = "tool_calls"
        case toolCallId = "tool_call_id"
    }
}

public struct ConversationUpdate: Codable {
    public let conversation: [Message]
}
