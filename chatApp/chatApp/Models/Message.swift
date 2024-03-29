//
//  Message.swift
//  chatApp
//
//  Created by thrxmbxne on 21/12/23.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}

extension Message {
	func toDictionary() -> [String: Any] {
		return [
			"id": id,
			"text": text,
			"isReceived": received,
			"timestamp": timestamp.timeIntervalSince1970 * 1000
		]
	}
}

