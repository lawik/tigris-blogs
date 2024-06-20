#!/usr/bin/env elixir

Mix.install([
  {:ex_aws, "~> 2.5"},
  {:ex_aws_s3, "~> 2.5"},
  {:hackney, "~> 1.20"},
  {:poison, "~> 3.0"},
  {:sweet_xml, "~> 0.6"}
])

Application.put_env(:ex_aws, :s3,
  scheme: "https://",
  host: "fly.storage.tigris.dev",
  port: 443)

alias ExAws.S3

bucket = System.fetch_env!("BUCKET_NAME")

bucket
|> S3.list_objects()
|> ExAws.request!()
|> dbg()
