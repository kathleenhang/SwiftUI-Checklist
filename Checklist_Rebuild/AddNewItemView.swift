//
//  AddNewItemView.swift
//  Checklist_Rebuild
//
//  Created by Kathleen Hang on 4/16/20.
//  Copyright © 2020 Team Cowdog. All rights reserved.
//

import SwiftUI

struct AddNewItemView: View {
    
    // allows us to access the todolist ViewModel so we can append new todo item
    var todoList : TodoList
    
    // user can input new todo item
    @State var newItemName = ""
    
    // allows us to dismiss the add item view
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            
            VStack {
                Image("poop")
                    .resizable()
                    .frame(width: 170, height: 170)
                
                // ********** ENTER NEW TODO ITEM NAME **********
                TextField("Enter new todo item name", text: $newItemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(10)
                    .frame(width: 380, height: 100)
                
                // ********** ADD ITEM BUTTON **********
                Button(action:{
                    // create a todo list item
                    let newTodoItem = TodoListItem(name: self.newItemName)
                    
                    // save new item to array
                    self.todoList.items.append(newTodoItem)
                    
                    self.todoList.saveListItems()
                    
                    // dismiss add item view
                    self.presentationMode.wrappedValue.dismiss()
                    
                }) {
                    ZStack {
                        
                        if newItemName.count == 0 { // DISABLED BUTTON
                             Rectangle()
                             .fill(Color.gray)
                             .cornerRadius(3)
                             .frame(width: 360, height: 40)
                             .padding()
                             .shadow(color: Color.black, radius: 2, x: 1, y: 1)
                        } else { // ENABLED BUTTON
                            Rectangle()
                            .fill(Color.orange)
                            .cornerRadius(3)
                            .frame(width: 360, height: 40)
                            .padding()
                            .shadow(color: Color.black, radius: 2, x: 1, y: 1)
                        }
                        
                        Text("ADD ITEM")
                             .font(.custom("blocked", size: 40))
                            .foregroundColor(Color.white)
                        
                    }
                    
                }
                .disabled(newItemName.count == 0)
                Spacer()
                
                // disable add item button if user did not input any values
                
                
            }
        }.navigationBarTitle("ADD NEW SHIT")
    }
}

struct AddNewItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewItemView(todoList: TodoList())
    }
}
