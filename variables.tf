variable "subscription_id" {}
variable "client_id" {}
variable "tenant_id" {}
variable "client_secret" {}
variable "object_id" {}
variable "workspace_id" {}
variable "primary_key" {}
variable "secondary_key" {}
variable "location" {}
variable "locations" {
  description = "List of locations"
  type        = list(string)
  default     = ["East Asia", "West Europe", "East US"]
}
variable "devprefix" {
  description = "Development Environment"
  default     = "DEV"
}
variable "prodprefix" {
  description = "Production Environment"
  default     = "PROD"
}
variable "testprefix" {
  description = "Testing Environment"
  default     = "TEST"

}
variable "prodsubnets" {
  description = "Production network1"
  type        = list(string)
  default     = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24"]
}
