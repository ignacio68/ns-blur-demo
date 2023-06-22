//
//  MaterialBlur.swift
//  MaterialBlur
//
//  Created by Philip Davis on 1/14/21.
//

import SwiftUI

class MaterialBlurProps: ObservableObject {
    // @Published var props: NSMutableDictionary = [:]
    @Published var blurValue: CGFloat = 0
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemUltraThinMaterialDark

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}


struct MaterialBlurView: View {
    @ObservedObject var props = MaterialBlurProps()
    private var materials: [UIBlurEffect.Style] = [ .systemUltraThinMaterial, .systemThinMaterial, .systemMaterial, .systemThickMaterial, .systemChromeMaterial]

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)


            VStack {
                Spacer()

                Color(.clear)
                    .background(Blur())
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                    .mask(LinearGradient(
                        gradient:
                            Gradient(
                                stops: [.init(color: .black, location: 0),
                                        .init(color: .black, location: 0.4),
                                        .init(color: .clear, location: 1)
                                ]),
                        startPoint: .bottom, endPoint: .top

                    ))

            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct MaterialBlurView_Previews: PreviewProvider {
    static var previews: some View {
        MaterialBlurView()
    }
}