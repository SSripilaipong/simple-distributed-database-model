spec AlwaysRespondToGetRequest observes eGetRequest, eGetResponse {
  var pendingRequests: set[string];

  start state NoPendingRequests {
    on eGetRequest do (req: tGetRequest) {
      pendingRequests += (req.key);
      goto HasPendingRequests;
    }
  }

  hot state HasPendingRequests {
    on eGetResponse do (resp: tGetResponse) {
      assert resp.key in pendingRequests, 
        format("response key {0} not in {1}", resp.key, pendingRequests);
      pendingRequests -= (resp.key);
      if(sizeof(pendingRequests) == 0) {
        goto NoPendingRequests;
      }
    }
    on eGetRequest do (req: tGetRequest) {
      pendingRequests += (req.key);
      goto HasPendingRequests;
    }
  }
}

