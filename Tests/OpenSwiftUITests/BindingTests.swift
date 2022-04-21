import Foundation
import Nimble
import Quick
import SwiftUI
//@testable import OpenSwiftUI

final class BindingTests: QuickSpec {
    override func spec() {
        describe("Binding") {
            context("init") {
                it("with a constant value") {
                    let binding = Binding.constant("Hello, World!")
//                    let value = binding.getter()

//                    expect(value).to(equal("Hello, World!"))
                }
            }
        }



    }
}
