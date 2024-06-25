//
//  ContentView.swift
//  ConvertSwiftUI
//
//  Created by Doohun Eum on 2023/04/30.
//

import SwiftUI

struct ContentView: View {
    @State var fahrenStr: String = ""
    @State var celsiusStr = "화씨를 입력하세요~"
    var body: some View {
        VStack(spacing: 10) {
            TextField("화씨입력", text: $fahrenStr)
                .textFieldStyle(.roundedBorder)
                .frame(width: 150)
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
            //Button 사진 참조
            Button("변환") {
                let fahrenheit = Double(self.fahrenStr)
                guard let fahren = fahrenheit else {
                    self.celsiusStr = "실수를 입력하세요!!"
                    return
                }
                let celsius = (fahren - 32.0) / 1.8
                self.celsiusStr = String(format: "%.1f", celsius)
            }
            HStack(spacing: 10) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text(celsiusStr)
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
