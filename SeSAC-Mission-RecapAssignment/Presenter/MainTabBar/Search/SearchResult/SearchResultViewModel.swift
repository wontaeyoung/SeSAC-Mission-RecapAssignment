//
//  SearchResultViewModel.swift
//  SeSAC-Mission-RecapAssignment
//
//  Created by 원태영 on 1/22/24.
//

import Alamofire

final class SearchResultViewModel: ViewModel {
  
  weak var coordinator: SearchCoordinator?
  var apiContainer = APIContainer()
  
  init(coordinator: SearchCoordinator) {
    self.coordinator = coordinator
  }
  
  func showProductDetailViewController(product: Product) {
    coordinator?.showProductDetailViewController(product: product)
  }
}

extension SearchResultViewModel {
  struct APIContainer {
    let display: Int = 30
    var page: Int = 0
    var total: Int = 30
    
    var start: Int {
      return display * (page - 1) + 1
    }
    
    var isEnd: Bool {
      return start > self.total
    }
    
    mutating func increasePage() {
      page += 1
    }
    
    mutating func resetPage() {
      page = 0
    }
  }
  
  func callRequest(query: String, sort: NaverAPIEndpoint.Sort, completion: @escaping ((count: Int, items: [Product])) -> Void) {
    apiContainer.increasePage()
    
    /// total을 초과하는 start에서 API Call을 시도하면 response total 값이 0으로 반환되어서, 결과뷰의 total count 라벨도 0으로 변하는 문제 수정
    guard !apiContainer.isEnd else { return }
    
    let endPoint = NaverAPIEndpoint.shop(
      query: query,
      display: apiContainer.display,
      start: apiContainer.start,
      sort: sort
    )
    
    let apiRequest = APIRequest(scheme: .https, host: .naverOpenAPI, endpoint: endPoint)
    let headers: HTTPHeaders = [
      APIKey.Naver.clientID.key: APIKey.Naver.clientID.value,
      APIKey.Naver.clientSecret.key: APIKey.Naver.clientSecret.value,
    ]
    
    do {
      try HTTPClient.shared.callRequest(
        apiRequest,
        modelType: ResponseDTO.self,
        headers: headers,
        method: .get
      ) { [weak self] result in
        guard let self else { return }
        
        switch result {
          case .success(let success):
            let products: [Product] = success.items.map { $0.asModel }
            
            self.apiContainer.total = success.total
            completion((count: success.total, items: products))
            
          case .failure(let failure):
            let apiError: APIError = HTTPClient.handleAFError(failure)
            
            coordinator?.handle(error: apiError)
        }
      }
    } catch {
      
      coordinator?.handle(error: error)
    }
  }
}
