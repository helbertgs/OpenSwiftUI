//
// GraphHost+Data.swift
// OpenSwiftUI
//
// Created by Helbert Gomes on Oct 29, 2026.
// Licensed under the MIT License. See LICENSE in the project root for license information.
// SPDX-License-Identifier: MIT

extension GraphHost {
    class Data {
        var environment: EnvironmentValues = .init()
        var globalSubgraph: Subgraph
        var graph: Graph?
        var hostPreferenceKeys: HostPreferenceKey
        var inputs: _GraphInputs
        var isHiddenForReuse: Bool
        var isRemoved: Bool
        var phase: _GraphInputs.Phase
        var rootSubgraph: Subgraph
        var time: Double
        var transaction: Transaction
        var transactionSeed: Int
        var updateSeed: Int

        init(environment: EnvironmentValues, globalSubgraph: Subgraph, graph: Graph? = nil, hostPreferenceKeys: HostPreferenceKey, inputs: _GraphInputs, isHiddenForReuse: Bool, isRemoved: Bool, phase: _GraphInputs.Phase, rootSubgraph: Subgraph, time: Double, transaction: Transaction, transactionSeed: Int, updateSeed: Int) {
            self.environment = environment
            self.globalSubgraph = globalSubgraph
            self.graph = graph
            self.hostPreferenceKeys = hostPreferenceKeys
            self.inputs = inputs
            self.isHiddenForReuse = isHiddenForReuse
            self.isRemoved = isRemoved
            self.phase = phase
            self.rootSubgraph = rootSubgraph
            self.time = time
            self.transaction = transaction
            self.transactionSeed = transactionSeed
            self.updateSeed = updateSeed
        }
    }
}
