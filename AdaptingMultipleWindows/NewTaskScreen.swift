//
//  NewTaskScreen.swift
//  AdaptingMultipleWindows
//
//  Created by Vladimir Butko on 2022-01-16.
//

import SwiftUI

struct NewTaskScreen: View {
    @State private var taskTitle: String = ""
    @State private var notes: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    VStack {
                        TextField("Title", text: $taskTitle)
                        
                        Divider()
                        
                        TextField("Notes", text: $notes)
                    }
                }
            }
            
            Button {
                print("Create button tapped")
            } label: {
                Text("Create Task")
            }
            .padding()
        }
    }
}

struct NewTaskScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskScreen()
    }
}
