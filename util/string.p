fun randomString(): string {
  var i: int;
  i = choose(2147483637);
  return format("{0}", i);
}
