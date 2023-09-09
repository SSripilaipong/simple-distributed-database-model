test tcReadOnce [main=TestReadOnce]:
  assert AlwaysRespondToGetRequest in ({Server, TestReadOnce});

test tcWriteOnce [main=TestWriteOnce]:
  assert AlwaysRespondToSetRequest in ({Server, TestWriteOnce});

test tcConsecutiveReadAfterWrite [main=TestConsecutiveReadAfterWrite]:
  assert ConsecutiveGetResponseShouldBeTheSame in ({Server, TestConsecutiveReadAfterWrite});
