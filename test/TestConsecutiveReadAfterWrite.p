machine TestConsecutiveReadAfterWrite {
  start state Init {
    entry {
      var server: machine;
      server = new Server();

      writeBlocking(this, server, "a", "123");
      readBlocking(this, server, "b");
      readBlocking(this, server, "c");
    }
  }
}
