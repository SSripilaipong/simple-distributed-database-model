spec AlwaysRespondToSetRequest observes eSetRequest, eSetResponse {
  var pendingRequests: set[string];

  start state NoPendingRequests {
    on eSetRequest do (req: tSetRequest) {
      pendingRequests += (req.memo);
      goto HasPendingRequests;
    }
  }

  hot state HasPendingRequests {
    on eSetResponse do (resp: tSetResponse) {
      assert resp.memo in pendingRequests, 
        format("response memo {0} not in {1}", resp.memo, pendingRequests);
      pendingRequests -= (resp.memo);
      if(sizeof(pendingRequests) == 0) {
        goto NoPendingRequests;
      }
    }
    on eSetRequest do (req: tSetRequest) {
      pendingRequests += (req.memo);
      goto HasPendingRequests;
    }
  }
}

