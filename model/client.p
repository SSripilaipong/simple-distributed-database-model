fun readBlocking(me: machine, server: machine, key: string): tGetResponse {
  var result: tGetResponse;

  send server, eGetRequest, (key=key, replyTo=me);

  receive {
    case eGetResponse:(resp: tGetResponse) { result = resp; }
  }
  return result;
}

fun writeBlocking(me: machine, server: machine, key: string, value: string): tSetResponse {
  var result: tSetResponse;
  var memo: string;

  memo = randomString();
  send server, eSetRequest, (key=key, value=value, replyTo=me, memo=memo);

  receive {
    case eSetResponse:(resp: tSetResponse) { result = resp; }
  }
  return result;
}

