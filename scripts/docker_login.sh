#!/bin/bash
aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin 339712990370.dkr.ecr.us-west-1.amazonaws.com