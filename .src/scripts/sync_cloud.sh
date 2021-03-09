#!/usr/bin/env bash

# Mount all cloud drives with Rclone

rclone mount GoogleDrive:/data Cloud/GoogleDrive &
rclone mount GooglePhotos:/ Cloud/GooglePhotos &
rclone mount OneDrive:/data Cloud/OneDrive &
rclone mount SchoolDrive:/ Cloud/SchoolDrive &