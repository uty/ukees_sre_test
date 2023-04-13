
variable "name" {
  description = "Lambda name"
  type        = string
}

variable "source_code_file" {
  description = "Lambda source code file path"
  type        = string
}

variable "handler" {
  description = "Lambda handler function name"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime"
  type        = string
  default     = "python3.9"
} 
