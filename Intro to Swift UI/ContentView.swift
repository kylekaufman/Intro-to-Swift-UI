//
//  ContentView.swift
//  Intro to Swift UI
//
//  Created by Kyle Kaufman and Emmanuel Makoye on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    @State var messages = [String]()
    @State var message = ""
    var body: some View {
        VStack {
            ScrollView {
                Section {
                    ForEach(messages, id:\.self) { message in
                        Text(message)
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.leading, 50)
                            .padding(.horizontal)
                    }
                    .padding(.vertical, 5)
                }
            }
            .refreshable {
                messages.removeAll()
            }
            HStack {
                TextField("Message", text: $message)
                Button(action: {
                    messages.append(message)
                    message = ""
                }) {
                    Image(systemName: "paperplane")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
