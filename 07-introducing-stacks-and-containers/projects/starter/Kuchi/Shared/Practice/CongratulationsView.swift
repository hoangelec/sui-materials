/// Copyright (c) 2023 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct CongratulationsView: View {
  let avatarSize: CGFloat = 120
  let userName: String

    @ObservedObject
      var challengesViewModel = ChallengesViewModel()

  init(userName: String) {
    self.userName = userName
  }
  
  var body: some View {
      VStack {
          Spacer()
          Text("Congratulations!")
              .font(.title)
          .foregroundColor(.gray)
          ZStack {
            // 2
            VStack(spacing: 0) {
              Rectangle()
                // 3
                .frame(height: 90)
                .foregroundColor(
                  Color(red: 0.5, green: 0, blue: 0).opacity(0.2))
              Rectangle()
                // 3
                .frame(height: 90)
                .foregroundColor(
                  Color(red: 0.6, green: 0.1, blue: 0.1).opacity(0.4))
            }

            // 4
            Image(systemName: "person.fill")
              .resizable()
              .padding()
              .frame(width: avatarSize, height: avatarSize)
              .background(Color.white.opacity(0.5))
              .cornerRadius(avatarSize / 2, antialiased: true)
              .shadow(radius: 4)

            // 5
            VStack() {
              Text(userName)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .shadow(radius: 7)
            }
            .padding()
          }
          // 6
          .frame(height: 180)
          Text("You’re awesome!")
            .fontWeight(.bold)
            .foregroundColor(.gray)
          Spacer()
          Button(action: {
            challengesViewModel.restart()
          }, label: {
            Text("Play Again")
          })
          .padding(.top)
      }
  }
}

struct CongratulationsView_Previews: PreviewProvider {
  static var previews: some View {
    CongratulationsView(userName: "Johnny Swift")
      .environmentObject(ChallengesViewModel())
  }
}
