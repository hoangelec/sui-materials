
import SwiftUI

struct RegisterView: View {

    @EnvironmentObject var userManager: UserManager

    enum Field: Hashable {
        case name
    }

    @FocusState var nameFieldFocused: Bool

    @State var name = ""
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                WelcomeMessageView()

                textInput
                characterCountView
                rememberMeView
                Button(action: registerUser) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .center)
                    Text("OK")
                        .font(.body)
                        .bold()
                }
                .bordered()
                .disabled(!userManager.isUserNameValid())
                Spacer()
            }
            .background(WelcomeBackgroundImage())
        }
    }

    var textInput: some View {
        TextField("Your name ...", text: $userManager.profile.name)
            .focused($nameFieldFocused)
            .submitLabel(.done)
            .onSubmit(registerUser)
            .bordered()
            .padding(.vertical)
    }

    var characterCountView: some View {
        HStack {
          Spacer()
          Text("\(userManager.profile.name.count)")
                .font(.subheadline)
            .foregroundColor(
              userManager.isUserNameValid() ? .green : .red)
            .padding(.trailing)
        }
        .padding(.bottom)
    }

    var rememberMeView: some View {
        HStack {
          Spacer()
          Toggle(isOn: $userManager.settings.rememberUser) {
            Text("Remember me")
              .font(.subheadline)
              .foregroundColor(.gray)
          }
            .fixedSize()
        }
        .padding(.horizontal)
    }
}

extension RegisterView {
    func registerUser() {
        nameFieldFocused = false
        if userManager.settings.rememberUser {
            userManager.persistProfile()
        } else {
            userManager.clear()
        }
        userManager.persistSettings()
        userManager.setRegistered()
    }
}


#Preview {
    RegisterView()
        .environmentObject(UserManager())
}

extension View {
    func bordered() -> some View {
        modifier(BorderedModifier())
    }
}
