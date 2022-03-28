import SwiftUI

let numberButton = [
    ["7", "8", "9"],
    ["4", "5", "6"],
    ["1", "2", "3"],
    ["del", "0", "check"]
]

struct ContentView: View {
    @State var currentNumber = ""
    @State var preChecked = "---"
    var body: some View {
        VStack {
            HStack {
                Text("history " + preChecked)
                    .monospacedDigit()
                    .padding(.horizontal)
                Text(
                    currentGame.ining < 10 
                    ? "\(currentGame.ining) Ining"
                    : "- END "
                )
                    .monospacedDigit()
                    .padding(.horizontal)
            }.padding(3)
            Text(displayNumber(currentNumber))
                .monospacedDigit()
                .font(.largeTitle)
                .foregroundColor(.accentColor)
                .padding()
            Text(displayScore())
                .monospacedDigit()
        }.padding()
        VStack {
            ForEach(numberButton, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Button(action: {
                            buttonPressed(item, &currentNumber)
                        }) {
                            Text(item)
                                .font(.title2)
                                .frame(width: 70, height: 70)
                        }
                        .buttonStyle(.bordered)
                        .disabled(buttonDisabled(item, currentNumber))
                    }
                }
            }
        }
    }
    
    func buttonPressed(_ item: String, _ text: inout String) {
        if item == "del" {
            if !text.isEmpty {
                text.removeLast()
            }
        } else if item == "check" {
            if text.count == 3 {
                preChecked = text
                checkNumber(text)
                text.removeAll()
            }
        } else {
            if text.count < 3 {
                text += item
            }
        }
    }
}
