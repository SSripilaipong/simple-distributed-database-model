machine TestReadOnce {
  start state Init {
    entry {
      var server: machine;
      server = new Server();

      readBlocking(this, server, "a");
    }
  }
}
