#!/bin/bash
sed -i 's/tagVersion/'"$1"'/g' k8s/api-deployment.yaml
