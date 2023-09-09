spec AlwaysRespondToSetRequest observes eSetRequest, eSetResponse {
  var pendingRequests: set[string];

  start state NoPendingRequests {
    on eSetRequest do (req: tSetRequest) {
      pendingRequests += (req.id);
      goto HasPendingRequests;
    }
  }

  hot state HasPendingRequests {
    on eSetResponse do (resp: tSetResponse) {
      assert resp.id in pendingRequests, 
        format("response id {0} not in {1}", resp.id, pendingRequests);
      pendingRequests -= (resp.id);
      if(sizeof(pendingRequests) == 0) {
        goto NoPendingRequests;
      }
    }
    on eSetRequest do (req: tSetRequest) {
      pendingRequests += (req.id);
      goto HasPendingRequests;
    }
  }
}

