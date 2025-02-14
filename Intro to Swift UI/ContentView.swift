//
//  ContentView.swift
//  Intro to Swift UI
//
//  Created by Kyle Kaufman and Emmanuel Makoye on 1/23/25.
//

import SwiftUI

struct Message: Identifiable {
    var id: UUID
    var message: String
    var date: Date

    init(message: String) {
        self.id = UUID()
        self.message = message
        self.date = Date()
    }
}

struct MessageView: View {
    var message: Message
    // Date formatter function
    
    func getDateFormat(_ date: Date) -> String {
        // Create a DateFormatter instance
        let dateFormatter = DateFormatter()
        
        //apply styling
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        // Return the formatted date string
        return dateFormatter.string(from: date)
    }
      
    
    var body: some View {
           VStack(alignment: .trailing) {
               // Message text
               Section {
                   Text(message.message)
                       .padding(10)
                       .background(Color.blue)
                       .foregroundColor(.white)
                       .cornerRadius(15)
                       .frame(maxWidth: .infinity, alignment: .trailing)
                       .padding(.leading, 50)
                       .padding(.horizontal)
                       .padding(.vertical, 5)
               }

               // Date and Time
               Section {
                   Text(getDateFormat(message.date))
                       .font(.footnote)
                       .foregroundColor(.gray)
                       .padding(.top, 2)
                       .padding(.trailing, 15)
               }
           }
       }
   }

struct ContentView: View {
    @State var messages = [Message]()
    @State var message = ""
    var body: some View {
        VStack {
            ScrollView {
                Section {
                    ForEach(messages) { msg in
                        MessageView(message: msg)
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
                    messages.append(Message(message: message))
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
