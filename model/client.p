fun readBlocking(me: machine, server: machine, id: string): tGetResponse {
  var result: tGetResponse;

  send server, eGetRequest, (id=id, replyTo=me);

  receive {
    case eGetResponse: (resp: tGetResponse) { result = resp; }
  }
  return result;
}

fun writeBlocking(me: machine, server: machine, id: string, value: string): tSetResponse {
  var result: tSetResponse;

  send server, eSetRequest, (id=id, value=value, replyTo=me);

  receive {
    case eSetResponse: (resp: tSetResponse) { result = resp; }
  }
  return result;
}

