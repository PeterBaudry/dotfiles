#!/bin/bash

rclone mount GoogleDrive:/data Cloud/GoogleDrive &
rclone mount GooglePhotos:/ Cloud/GooglePhotos &
rclone mount OneDrive:/data Cloud/OneDrive &
rclone mount SchoolDrive:/ Cloud/SchoolDrive &