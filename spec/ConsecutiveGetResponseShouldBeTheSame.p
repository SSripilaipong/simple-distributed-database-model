spec ConsecutiveGetResponseShouldBeTheSame observes eGetResponse {
  var latestValue: string;

  start state Init {
    on eGetResponse do (resp: tGetResponse) {
      latestValue = resp.value;
      goto Verify;
    }
  }

  state Verify {
    on eGetResponse do (resp: tGetResponse) {
      assert resp.value == latestValue;
    }
  }
}
