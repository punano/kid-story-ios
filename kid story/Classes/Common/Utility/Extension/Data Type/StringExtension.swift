//
//  StringExtension.swift
//  angia
//
//  Created by Quang Pham on 8/19/17.
//  Copyright © 2017 Quang Pham. All rights reserved.
//

import Foundation

extension String {
    
    func avatarURL(shouldEscape: Bool = true) -> URL? {
        var raw_url = self
        if !raw_url.contains("http") {
            raw_url = "http://\(raw_url)"
        }
        
        if shouldEscape, let escaped = raw_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            return URL(string: escaped)
        }
        return URL(string: raw_url)
    }
}
