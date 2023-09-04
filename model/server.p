machine Server {
  start state Init {
    on eGetRequest do (req: tGetRequest) {
      send req.replyTo, eGetResponse, (key=req.key,);
    }
    on eSetRequest do (req: tSetRequest) {
      send req.replyTo, eSetResponse, (ok=true, memo=req.memo);
    }
  }
}
