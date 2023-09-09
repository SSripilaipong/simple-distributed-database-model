machine Server {
  var value: string;

  start state Init {
    on eGetRequest do (req: tGetRequest) {
      send req.replyTo, eGetResponse, (id=req.id, value=value);
    }
    on eSetRequest do (req: tSetRequest) {
      value = req.value;
      send req.replyTo, eSetResponse, (id=req.id, ok=true);
    }
  }
}
