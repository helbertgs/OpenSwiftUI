SWIFT_EXE=swift
SWIFT_TEST_FLAGS=
SWIFT_BUILD_FLAGS=-Xcc -Wunguarded-availability

debug:
	$(SWIFT_EXE) build -c debug $(SWIFT_BUILD_FLAGS)

release:
	$(SWIFT_EXE) build -c release $(SWIFT_BUILD_FLAGS)

test-debug:
	$(SWIFT_EXE) test -c debug $(SWIFT_BUILD_FLAGS) $(SWIFT_TEST_FLAGS)

test-debug-sanitize-thread:
	$(SWIFT_EXE) test -c debug --sanitize thread $(SWIFT_BUILD_FLAGS) $(SWIFT_TEST_FLAGS)

test-release:
	$(SWIFT_EXE) test -c release $(SWIFT_BUILD_FLAGS) $(SWIFT_TEST_FLAGS)

swift-version:
	$(SWIFT_EXE) -version

generate-xcodeproj:
	$(SWIFT_EXE) package $(SWIFT_BUILD_FLAGS) generate-xcodeproj --enable-code-coverage

lint:
	$(SWIFT_EXE) run swift-lint

clean:
	rm -rf .build

docc:
	@echo "Building documentation..."
	@sudo swift package --allow-writing-to-directory docs/ generate-documentation --target OpenSwiftUI --disable-indexing --transform-for-static-hosting --hosting-base-path OpenSwiftUI --output-path docs/
	@echo "Comminting..."
	@git add . && git commit -m "chore: update documentation" && git push 

.PHONY: debug release \
	    test-debug \
	    test-release \
	    swift-version \
	    generate-xcodeproj \
	    clean