# using locals
resource "local_file" "myfile" {
  filename = local.ashu
  content  = local.content
}
locals {
  ashu    = "local.txt"
  content = "hello my name is ashu and i welcome you "
}



#by using random generate random id
resource "local_file" "myfile1" {
  filename = local.ashu1
  content  = random_id.content.hex
}
locals {
  ashu1    = "random_id.txt"
  content1 = "hello my name is ashu "
}
resource "random_id" "content" {
  byte_length = 8
}



#using string
resource "local_file" "myfile2" {
  filename = "string.txt"
  content  = var.ashu2
}
variable "ashu2" {
  type        = string
  description = "content"
  default     = "this is my project"
}



#using number
resource "local_file" "myfile3" {
  filename = "number.txt"
  content  = var.ashu3
}
variable "ashu3" {
  type        = number
  description = "content"
  default     = 1983
}



#using list
resource "local_file" "myfile4" {
  filename = "list.txt"
  content  = var.ashu4[1]
}
variable "ashu4" {
  type        = list(any)
  description = "content"
  default     = ["2001", "content list"]
}



#using map
resource "local_file" "myfile5" {
  filename = "map.txt"
  content  = var.ashu5["pass-content"]
}
variable "ashu5" {
  type        = map(any)
  description = "pass the value of content"
  default = {
    "key1"         = "value1"
    "key2"         = "value2"
    "key3"         = "value3"
    "pass-content" = "my content"
  }
}



#using object
resource "local_file" "myfile6" {
  filename = "object.txt"
  content  = var.ashu6["content"]
}
variable "ashu6" {
  type = object({
    filename = string,
    content  = number
  })
  description = "pass the value of content"
  default = {
    content  = 0803
    filename = "kumar"
  }

}



#passing the content through terraform.tfvars
resource "local_file" "myfile7" {
  filename = var.ashu
  content  = var.content

}



# output block
resource "local_file" "myfile8" {
  filename = var.ashu
  content  = var.content
}
output "output_name" {
  value = local_file.myfile8.content

}