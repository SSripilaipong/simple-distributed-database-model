machine Server {
  start state Init {
    on eGetRequest do (req: tGetRequest) {
      send req.replyTo, eGetResponse, (key=req.key,);
    }
  }
}
