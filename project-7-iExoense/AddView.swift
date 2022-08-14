//
//  AddView.swift
//  project-7-iExoense
//
//  Created by Roro Solutions on 14/08/22.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    let types = ["Business", "Personal"]
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var expenses: Expenses
    var body: some View {
        NavigationView{
            List{
                TextField("name", text: $name)
                Picker("type", selection: $type){
                    ForEach(types,id: \.self){
                        Text($0)
                    }
                }
                TextField("Amount",value: $amount, format: .currency(code:Locale.current.currencyCode ?? "USD") )
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add New Expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
               
            }
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
