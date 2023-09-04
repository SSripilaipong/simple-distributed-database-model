type tGetRequest = (key: string, replyTo: machine);
type tGetResponse = (key: string);

event eGetRequest: tGetRequest;
event eGetResponse: tGetResponse;
