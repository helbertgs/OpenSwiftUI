import Foundation
import Nimble
import Quick
@testable import OpenSwiftUI

final class AppTests: QuickSpec {
    override func spec() {
        describe("AppStorage") {
            context("store") {
                it("username") {
                    @AppStorage("username") var username: String = "Anonymous"
                    username = "Helbert"
                    expect(_username.wrappedValue).to(equal("Helbert"))
                }

                it("age") {
                    @AppStorage("age") var age: Int = 32
                    age = 33
                    expect(_age.wrappedValue).to(equal(33))
                }

                it("is human?") {
                    @AppStorage("isHuman") var isHuman: Bool = false
                    isHuman = true
                    expect(_isHuman.wrappedValue).to(beTrue())
                }
            }
        }

    }
}
