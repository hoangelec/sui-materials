import SwiftUI

struct ColorSlider: View {
    
    let min: Double = 0
    let max: Double = 1
    let trackColor: Color
    @Binding var value: Double
    var body: some View {
        HStack {
            Text("\(Int(min * 255))")
                .padding()
            Slider(value: $value, in: min ... max)
                .tint(trackColor)
            Text("\(Int(max * 255))")
                .padding()
        }
    }
}

#Preview {
    Group {
        ColorSlider(trackColor: .red, value: .constant(255))
    }
}
