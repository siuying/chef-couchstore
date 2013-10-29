# Chef cookbook for Couchstore

## Description

Chef cookbook for [couchstore](https://github.com/couchbaselabs/couchstore).

## Requirements

### Platform

- Ubuntu or Debian

### Cookbooks

This cookbook depends on the following external cookbooks:

- git

### Usage

#### couchstore::default

Just include `couchstore` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[couchstore]"
  ]
}
```