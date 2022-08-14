//
//  ContentView.swift
//  project-7-iExoense
//
//  Created by Roro Solutions on 14/08/22.
//

import SwiftUI
struct AmountText: View {
    let amount: Double
    let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    
    var body: some View {
        if amount > 100 {
            Text(amount, format: localCurrency)
                .foregroundColor(.red)
        } else if amount > 10 {
            Text(amount, format: localCurrency)
                .foregroundColor(.yellow)
        } else {
            Text(amount, format: localCurrency)
                .foregroundColor(.green)
        }
    }
}

struct ContentView: View {
    @State private var showingAddExpense = false
    let types = ["Personal", "Business"]
    @StateObject var expenses = Expenses()
    var body: some View {
        NavigationView {
            List {
                ForEach(types,id: \.self){ type in
                    Section(type){
                        ForEach(expenses.items) { item in
                            if item.type == type {
                                HStack{
                                    VStack(alignment: .leading){
                                        Text(item.name)
                                            .font(.headline)
                                        Text(item.type)
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                    
                                    AmountText(amount: item.amount)
                                    
                                }
                                
                            }else{}
                            
                            
                        }
                    }
                }
                
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
