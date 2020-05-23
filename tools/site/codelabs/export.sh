#!/bin/sh
# Export markdown to website
# (required "claat")
claat export $(ls | grep .md)