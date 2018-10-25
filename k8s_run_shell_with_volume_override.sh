#!/bin/sh
kubectl run -i --rm --tty makanashell --overrides='
{
  "apiVersion": "v1",
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "makanashell",
            "image": "makanab/utilityshell",
            "args": [
              "bash"
            ],
            "stdin": true,
            "stdinOnce": true,
            "tty": true,
            "volumeMounts": [{
              "mountPath": "/dev/urandom",
              "name": "randy"
            }]
          }
        ],
        "volumes": [{
          "name":"randy",
          "hostPath": {
            "path": "/dev/random"
           },
          "emptyDir":{}
        }]
      }
    }
  }
}
'  --image=makanab/utilityshell --restart=Never -- bash
