variable "region" {
}

variable "remote_state_bucket_name" {
  description = "Terraform remote state bucket name"
}

variable "environment_type" {
  description = "environment"
}

variable "nextcloud_instance_type" {
}

variable "bastion_inventory" {
}

variable "nextcloud_instance_count" {
  default = "1"
}

# LB
variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  default     = true
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle"
  default     = 60
}

variable "connection_draining" {
  description = "Boolean to enable connection draining"
  default     = false
}

variable "connection_draining_timeout" {
  description = "The time in seconds to allow for connections to drain"
  default     = 300
}

variable "nextcloud_health_check" {
  description = "A health check block"
  default     = []
}

variable "password_length" {
  default = "18"
}

variable "create_db_subnet_group" {
  description = "Whether to create a database subnet group"
  default     = false
}

variable "create_db_parameter_group" {
  description = "Whether to create a database parameter group"
  default     = true
}

variable "create_db_option_group" {
  description = "Whether to create a database option group"
  default     = false
}

# DB parameter group
variable "family" {
  description = "The family of the DB parameter group"
  default     = "mariadb10.2"
}

variable "parameters" {
  description = "A list of DB parameters (map) to apply"
  type = list(map(string))
  default = [
    {
      name         = "tx_isolation"
      value        = "READ-COMMITTED"
      apply_method = "pending-reboot"
    },
  ]
}

variable "engine" {
  description = "The database engine to use"
  default     = "MariaDB"
}

variable "engine_version" {
  description = "The engine version to use"
  default     = "10.2"
}

# DB option group
variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  default     = ""
}

variable "options" {
  type        = list(string)
  description = "A list of Options to apply."
  default     = []
}

variable "rds_instance_class" {
  description = "The instance type of the RDS instance"
}

variable "rds_allocated_storage" {
  description = "The allocated storage in gigabytes"
}

variable "storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'."
  default     = "gp2"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  default     = true
}

variable "license_model" {
  description = "License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1"
  default     = ""
}

variable "port" {
  description = "The port on which the DB accepts connections"
  default     = "3306"
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  default     = false
}

variable "replicate_source_db" {
  description = "Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate."
  default     = ""
}

variable "snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
  default     = ""
}

variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  default     = "true"
}

variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
  default     = 0
}

variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  default     = false
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  default     = false
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  default     = "Mon:00:00-Mon:03:00"
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  default     = true
}

variable "copy_tags_to_snapshot" {
  description = "On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified)"
  default     = true
}

variable "mariadb_backup_retention_period" {
  description = "The days to retain backups for"
  default     = 28
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  default     = "03:00-06:00"
}

variable "mariadb_monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
}

variable "timezone" {
  description = "(Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information."
  default     = ""
}

variable "character_set_name" {
  description = "(Optional) The character set name to use for DB encoding in Oracle instances. This can't be changed. See Oracle Character Sets Supported in Amazon RDS for more information."
  default     = ""
}

variable "tags" {
  type = map(string)
}

variable "snap_tag" {
  default = "Name"
}

variable "environment_name" {
}

variable "ebs_backup" {
  type = map(string)

  default = {
    schedule           = "cron(0 01 * * ? *)"
    cold_storage_after = 14
    delete_after       = 120
  }
}

variable "nextcloud_redis_node_type" {
  default = "cache.m4.large"
}

variable "number_cache_clusters" {
  description = "Redis cache clusters"
  default     = "3"
}
