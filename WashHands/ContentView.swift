//
//  ContentView.swift
//  WashHands
//
//  Created by Vitaliy Tim on 30.05.2020.
//  Copyright © 2020 Vitalii Tymoshenko. All rights reserved.
//

import SwiftUI

struct AnimatedView<Content>: UIViewRepresentable where Content: View {
    let startTime: CFTimeInterval
    let content: () -> Content

    func makeUIView(context: UIViewRepresentableContext<AnimatedView>) -> UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false

        let sub = UIHostingController(rootView: content())
        sub.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sub.view)
        sub.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        sub.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true

        let jumpAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        jumpAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        jumpAnimation.values = [0.0, 0.0, -15.0, -20.0, -20.0, -18.0, 0.0]

        let squashAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
        squashAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        squashAnimation.values = [0.9, 0.8, 0.9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [jumpAnimation, squashAnimation]
        groupAnimation.beginTime = CACurrentMediaTime() + startTime
        groupAnimation.duration = 0.95
        groupAnimation.repeatCount = Float.infinity

        view.layer.add(groupAnimation, forKey: "microbeJumpingAnimation")
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AnimatedView>) { }

    typealias UIViewType = UIView
}

struct ContentView: View {
    var body: some View {
        VStack {
            HandARView()
            VStack(alignment: .leading) {
                HStack {
                    Text("Microbes")
                        .font(.title)
                        .fixedSize()
                    Spacer(minLength: 5)
                    HStack {
                        AnimatedView(startTime: 1) {
                            Image("microbe1").resizable().scaledToFit().frame(width: 25.0, height: 25.0).clipShape(Circle())
                        }
                        AnimatedView(startTime: 1.05) {
                            Image("microbe2").resizable().scaledToFit().frame(width: 25.0, height: 25.0).clipShape(Circle())
                        }
                        AnimatedView(startTime: 1.1) {
                            Image("microbe3").resizable().scaledToFit().frame(width: 25.0, height: 25.0).clipShape(Circle())
                        }
                        AnimatedView(startTime: 1.15) {
                            Image("microbe4").resizable().scaledToFit().frame(width: 25.0, height: 25.0).clipShape(Circle())
                        }
                        AnimatedView(startTime: 1.2) {
                            Image("microbe5").resizable().scaledToFit().frame(width: 25.0, height: 25.0).clipShape(Circle())
                        }
                    }
                    .frame(minWidth: 125, maxWidth: 125, minHeight: 0, maxHeight: 30, alignment: .topLeading)
                    Spacer(minLength: 5)
                }
                Text("Wash you hands to see them disappear")
                    .font(.subheadline)
                HStack {
                    Spacer()
                    Button(action: { print("test") },
                            label: {
                                Text("Settings")
                                    .foregroundColor(.purple)
                                    .font(.headline)
                                    .padding(EdgeInsets(top: 7, leading: 7, bottom: 7, trailing: 7))
                                    .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.purple, lineWidth: 2)
                                )
                    })
                }
            }
            .padding()
        }
    }

}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
