spec AlwaysRespondToGetRequest observes eGetRequest, eGetResponse {
  var pendingRequests: set[string];

  start state NoPendingRequests {
    on eGetRequest do (req: tGetRequest) {
      pendingRequests += (req.id);
      goto HasPendingRequests;
    }
  }

  hot state HasPendingRequests {
    on eGetResponse do (resp: tGetResponse) {
      assert resp.id in pendingRequests, 
        format("response id {0} not in {1}", resp.id, pendingRequests);
      pendingRequests -= (resp.id);
      if(sizeof(pendingRequests) == 0) {
        goto NoPendingRequests;
      }
    }
    on eGetRequest do (req: tGetRequest) {
      pendingRequests += (req.id);
      goto HasPendingRequests;
    }
  }
}

