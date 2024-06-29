//
//  ContentView.swift
//  Custom property wrapper
//
//  Created by Sunjay Kalsi on 29/06/2024.
//

import SwiftUI

import SwiftUI

@propertyWrapper
struct Trimmed {
    var string: String

    init(wrappedValue: String) {
        self.string = wrappedValue
    }

    var wrappedValue: String {
        get {
            string.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        set {
            string = newValue
        }
    }
}

struct API {
    @Trimmed var url: String
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(makeURL().absoluteString)
                .font(.headline)
                .background(Color.blue)
                .padding()
        }
    }

    func makeURL() -> URL {
        var api = API(url: "https://myapp.com/  ")
        return URL(string: api.url)!
    }
}

#Preview {
    ContentView()
}
