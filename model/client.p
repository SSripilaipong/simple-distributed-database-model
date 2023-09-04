machine Client {
  start state Init {
    entry (server: machine) {
      send server, eGetRequest, (key="abc", replyTo=this);
    }
    ignore eGetResponse;
  }
}
