type tGetRequest = (key: string, replyTo: machine);
type tGetResponse = (key: string);

event eGetRequest: tGetRequest;
event eGetResponse: tGetResponse;

type tSetRequest = (key: string, value: string, replyTo: machine, memo: string);
type tSetResponse = (ok: bool, memo: string);

event eSetRequest: tSetRequest;
event eSetResponse: tSetResponse;
