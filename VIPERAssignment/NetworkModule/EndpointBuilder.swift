//
//  EndpointBuilder.swift
//  VIPERAssignment
//
//  Created by Abdullah Ansari on 17/07/24.
//

import Foundation

// MARK:- EndpointBuilder to take value for EndPointImplementation.
class EndpointBuilder {
    // Variables
    private var path: Path = .university
    private var method: HTTPMethod = .get
    private var authenticated: Bool = false
    private var parameters: [String: String]?
    
    // set the path.
    @discardableResult
    func setPath(_ value: Path) -> EndpointBuilder {
        self.path = value
        return self
    }
    
    // set the HTTPMethod.
    @discardableResult
    func setMethod(_ value: HTTPMethod) -> EndpointBuilder {
        self.method = value
        return self
    }
    
    // set the Authenticated.
    @discardableResult
    func setAuthenticated(_ value: Bool) -> EndpointBuilder {
        self.authenticated = value
        return self
    }
    
    // set the QueryParameters
    @discardableResult
    func setQueryParameters(_ value: [String: String]) -> EndpointBuilder {
        self.parameters = value
        return self
    }
    
    // build the assigned values and return the EndPointImpl concrete type.
    func build() -> Endpoint {
        var endpoint = EndpointImpl()
        endpoint.method = method
        endpoint.path = path
        endpoint.authenticatedApi = authenticated
        endpoint.parameters = parameters
        return endpoint
    }
    
}
