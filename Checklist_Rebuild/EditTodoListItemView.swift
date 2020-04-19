//
//  EditTodoListItemView.swift
//  Checklist_Rebuild
//
//  Created by Kathleen Hang on 4/18/20.
//  Copyright © 2020 Team Cowdog. All rights reserved.
//

import SwiftUI

struct EditTodoListItemView: View {
    @Binding var todoListItem : TodoListItem
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Form {
            Section(header: Text("Todo Item Name").font(.custom("Minecraft-Regular", size: 20))) {
                TextField("Task name", text: $todoListItem.name)
            }
            Section(header: Text("Todo Item Status").font(.custom("Minecraft-Regular", size: 20))) {
                Toggle("Completed", isOn: $todoListItem.isChecked)
                
                
            }
        }.font(.custom("Minecraft-Regular", size: 25))
            
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Back")
                        .font(.custom("blocked", size: 25))//.foregroundColor(Color.white)
            })
        
    }
}

struct EditTodoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditTodoListItemView(todoListItem: .constant(TodoListItem(name: "Walk the dog")))
    }
}
