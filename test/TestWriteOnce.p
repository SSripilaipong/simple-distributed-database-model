machine TestWriteOnce {
  start state Init {
    entry {
      var server: machine;
      server = new Server();

      writeBlocking(this, server, "a", "123");
    }
  }
}
