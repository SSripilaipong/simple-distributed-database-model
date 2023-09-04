machine TestMain {
  start state Init {
    entry {
      var server: machine;
      server = new Server();
      new Client(server);
    }
  }
}
