// Name: Kathleen Hang
// Start Date: 4/7/20.
// Project Name: Checklist_Rebuild
// File Name: TodoListItem.swift
// Description: Model of MVVM

import SwiftUI

struct TodoListItem: Identifiable {
    var id = UUID() // unique identifier
    var name = "" // todo list item name
    var isChecked = false // is item completed or not?
}
