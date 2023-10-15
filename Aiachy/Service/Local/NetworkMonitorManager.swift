//
//  NetworkMonitorManager.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import Foundation
import Network
import Combine

class NetworkMonitorManager: ObservableObject {
    private var monitor: NWPathMonitor?
    private let queue = DispatchQueue(label: "NetworkMonitor")
    let isConnectedToEthernet: CurrentValueSubject<Bool,Never>
    
    init(isConnectedToEthernet: Bool = false ) {
        self.isConnectedToEthernet = CurrentValueSubject<Bool,Never>(isConnectedToEthernet)
    }
    /// It checks if the user has wi-fi or any internet connection.
    func startEthernetCheck() {
        /// monitör starting
        monitor = NWPathMonitor()
        monitor!.start(queue: queue)
        /// ethernet checking
        monitor!.pathUpdateHandler = { path in
            DispatchQueue.main.async { [self] in
                if path.status == .satisfied {
                    print(ACYPrintAppInfo.ethernetConnectionFound.printAppInfo())
                    isConnectedToEthernet.send(true)
                } else {
                    print(ACYErrorAppInfo.ethernetConnectionNotFound.printAppInfo("NetworkMonitorManager"))
                    isConnectedToEthernet.send(false)
                }
            }
        }
    }
    
    func cancelEthernetConnection() {
        print(ACYPrintAppInfo.ethernetCancalled.printAppInfo())
        monitor!.cancel()
    }
}

