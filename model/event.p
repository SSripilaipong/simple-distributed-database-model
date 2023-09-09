type tGetRequest = (id: string, replyTo: machine);
type tGetResponse = (id: string, value: string);

event eGetRequest: tGetRequest;
event eGetResponse: tGetResponse;

type tSetRequest = (id: string, value: string, replyTo: machine);
type tSetResponse = (id: string, ok: bool);

event eSetRequest: tSetRequest;
event eSetResponse: tSetResponse;
