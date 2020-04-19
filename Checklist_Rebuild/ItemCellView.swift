// Name: Kathleen Hang
// Start Date: 4/7/20.
// Project Name: Checklist_Rebuild
// File Name: ItemCellView.swift
// Description: Display each todo list item as a cell view

import SwiftUI

struct ItemCellView: View {
    
    // accepts param value of type: todo list item
    // Note: @Binding informs xcode that this value exists somewhere and we want to share it with cell view struct
    @Binding var todoListItem: TodoListItem
    
    // Display each todo list item as a cell-type of view
    var body: some View {
        
//        Button(action: {
//            // when user clicks this cell view, toggle the "task completion switch"
//            self.todoListItem.isChecked.toggle()
//        }) {
        NavigationLink(destination: EditTodoListItemView(todoListItem: $todoListItem)) {
            
            // ******* DISPLAY TODO LIST ITEM NAME *********
            HStack {
                //Spacer()
                Text(todoListItem.name)
                
                .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                .opacity(0.8)
                .font(.custom("Minecraft-Regular", size: 25))
                .fixedSize(horizontal: false, vertical: true)
                   
                Spacer()
                
                // ******* DISPLAY COMPLETION STATUS ICON **********
                todoListItem.isChecked ?
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 18, height: 18)
                        .shadow(color: Color.black, radius: 1, x: 1, y: 1)
                    : Rectangle()
                        .fill(Color.gray)
                        .frame(width: 18, height: 18)
                        .shadow(color: Color.black, radius: 1, x: -1, y: -1)
        }.padding(8)
        }
    }
}
