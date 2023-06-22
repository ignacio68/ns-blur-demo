//
//  RegularBlur.swift
//  RegularBlur
//
//  Created by Philip Davis on 1/14/21.
//

import SwiftUI

class BlurProps: ObservableObject {
    // @Published var props: NSMutableDictionary = [:]
    @Published var blurValue: CGFloat = 0
}

struct RegularBlurView: View {
    @ObservedObject var props = BlurProps()
    private var materials: [UIBlurEffect.Style] = [ .systemUltraThinMaterial, .systemThinMaterial, .systemMaterial, .systemThickMaterial, .systemChromeMaterial]

    var body: some View {
        VStack {
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .blur(radius: props.blurValue)
            .edgesIgnoringSafeArea(.all)
            Text("Blur value is: \(props.blurValue)")
        }

    }
}

struct RegularBlurView_Previews: PreviewProvider {
    static var previews: some View {
        RegularBlurView()
    }
}