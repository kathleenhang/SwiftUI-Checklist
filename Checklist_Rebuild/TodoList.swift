// Name: Kathleen Hang
// Start Date: 4/7/20.
// Project Name: Checklist_Rebuild
// File Name: TodoList.swift
// Description: ViewModel. Watches for changes on item array property

import SwiftUI

class TodoList: ObservableObject {
    
    // Array of TodoListItems
    @Published var items = [TodoListItem(name: "Roll around in bed", isChecked: true),
                 TodoListItem(name: "Watch Corpse Bride on Netflix"),
                 TodoListItem(name: "DRINK agua mucho!!!!!!!!"),
                 TodoListItem(name: "Eat mah foods (n0mn0m fish)"),
                 TodoListItem(name: "Roll around in bed some more"),
                 TodoListItem(name: "Do moar barrel rolls", isChecked: true),
                 TodoListItem(name: "Eat moar food"),
                 TodoListItem(name: "Buy MOAR derpsauce"),
                 TodoListItem(name: "Zomg. 2 much programming"),
                 TodoListItem(name: "FEED MEHHH!!"),
    ]
   
}
