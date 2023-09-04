test tcReadOnce [main=TestReadOnce]:
  assert AlwaysRespondToGetRequest in ({Server, TestReadOnce});

test tcWriteOnce [main=TestWriteOnce]:
  assert AlwaysRespondToSetRequest in ({Server, TestWriteOnce});
