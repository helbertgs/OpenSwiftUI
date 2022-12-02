# Environment.

PRODUCT_NAME := OpenSwiftUI
SCHEME_NAME := ${PRODUCT_NAME}
PACKAGE := Package.swift
WORKSPACE := ./.swiftpm/xcode/package.xcworkspace
SNAPSHOT_TESTS_TARGET_NAME := Snapshot
UNIT_TESTS_TARGET_NAME := Unit

# Device.

TEST_SDK := iphonesimulator
TEST_CONFIGURATION := Debug
TEST_PLATFORM := iOS Simulator
TEST_DEVICE ?= iPhone 14 Pro
TEST_OS ?= 16.0
TEST_DESTINATION := 'platform=${TEST_PLATFORM},name=${TEST_DEVICE},OS=${TEST_OS}'

# Tools.

SWIFT_EXE=swift
SWIFT_TEST_FLAGS=
SWIFT_BUILD_FLAGS=-Xcc -Wunguarded-availability
SWIFT_VERSION := 5.7

# Export Settings.

SDK := iphoneos
CONFIGURATION := Release
BUILD_PATH := ./output/${SDK}/${CONFIGURATION}
RELEASE_PATH := ${EXPORT_PATH}/${PRODUCT_NAME}.ipa

.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":[^#]*? #| #"}; {printf "%-57s%s\n", $$1 $$3, $$2}'

.PHONY: install-bundler
install-bundler: # Install Bundler
	sudo gem install bundler

.PHONY: install-bundler-dependencies
install-bundler-dependencies: # Install Bundler dependencies
	bundle install

.PHONY: install-homebrew
install-homebrew: # Install Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.PHONY: install-mint
install-mint: # Install Mint
	brew untap homebrew-community/mint
	brew tap mint-lang/mint-lang

.PHONY: install-mint-dependencies
install-mint-dependencies: # Install Mint dependencies
	mint bootstrap

.PHONY: generate-xcodeproj
generate-xcodeproj: # Generate project with Swift Package Manager (Deprecated)
	$(SWIFT_EXE) package $(SWIFT_BUILD_FLAGS) generate-xcodeproj --enable-code-coverage
	$(MAKE) open

.PHONY: open
open: # Open Package.swift in Xcode
	open ./$(PACKAGE)

.PHONY: clean
clean: # Delete cache
	Delete .build and .swiftpm folders
	@rm -rf .build/
	@rm -rf .swiftpm/
#	xcodebuild clean -alltargets

.PHONY: swift-version
swift-version:
	$(SWIFT_EXE) -version

.PHONY: swift-debug
swift-debug:
	@$(SWIFT_EXE) build -c debug $(SWIFT_BUILD_FLAGS)

.PHONY: swift-release
swift-release:
	@$(SWIFT_EXE) build -c release $(SWIFT_BUILD_FLAGS)

.PHONY: swift-test-debug
swift-test-debug:
	@$(SWIFT_EXE) test -c debug $(SWIFT_BUILD_FLAGS) $(SWIFT_TEST_FLAGS)

.PHONY: swift-test-debug-sanitize-thread
swift-test-debug-sanitize-thread:
	@$(SWIFT_EXE) test -c debug --sanitize thread $(SWIFT_BUILD_FLAGS) $(SWIFT_TEST_FLAGS)

.PHONY: swift-test-release
swift-test-release:
	@$(SWIFT_EXE) test -c release $(SWIFT_BUILD_FLAGS) $(SWIFT_TEST_FLAGS)

.PHONY: lint
lint:
	@$(SWIFT_EXE) run swift-lint
