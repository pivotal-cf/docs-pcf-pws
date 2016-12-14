## Status Codes

Autoscaling uses conventional HTTP response codes to indicate the success or failure of an API request. Generally, codes in the 2xx range indicate success, codes in the 4xx range indicate an error that failed given the information provided (e.g., a required parameter was omitted), and codes in the 5xx range indicate an error with the Autoscaling server.

Code | Description
--------- | -------
200 - OK | Everything worked as expected
400 - bad request | The request is syntactically incorrect
401 - unauthorized | The access token has expired or is invalid
404 - not found | The route requested does not exist
422 - unprocessable entity | The request is syntactically correct but the supplied values do not work

```http
HTTP/1.1 400 bad request
{
  "description": "Malformed request.",
  "errors": [
    {
      "resource": "scheduled_limit_change",
      "messages": [
        "Unexpected token 9 in JSON at position 1."
      ]
    }
  ]
}
```

```http
HTTP/1.1 404 not found
{
   "description": "Unable to find scheduled limit change with guid: 4ff80e73-5cde-4430-936a-dcbc7f0b7c18",
}
```

```http
HTTP/1.1 422 unprocessable entity
{
  "description": "Validation of resource failed.",
  "errors": [
    {
      "resource": "scheduled_limit_change",
      "messages": [
        "Scheduled limit changes cannot conflict."
      ]
    }
  ]
}
```