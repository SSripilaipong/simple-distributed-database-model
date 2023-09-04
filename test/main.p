test tcMain [main=TestMain]:
  assert AlwaysRespondToGetRequest in ({Client, Server, TestMain});
