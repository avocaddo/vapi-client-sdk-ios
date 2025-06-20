//
//  WebCallResponse.swift
//
//
//  Created by Andrew Carter on 12/13/23.
//

import Foundation

public struct ArtifactPlan: Decodable {
    public let videoRecordingEnabled: Bool
}

public struct Monitor: Decodable {
    public let listenUrl: String
    public let controlUrl: String
}

public struct WebCallResponse: Decodable {
    let webCallUrl: URL
    public let id: String
    public let artifactPlan: ArtifactPlan?
    public let monitor: Monitor?
}
