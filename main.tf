terraform { 
  cloud { 
    
    organization = "aws_blog" 

    workspaces { 
      n
      
      ame = "aws_blog" 
    } 
  } 
  # AWSなどのサービスを使うためのプロバイダー設定
  required_providers {
    aws = {
      source  = "hashicorp/aws"    # AWS用のプロバイダーを指定
      version = "~> 3.8.0"         # 使用するバージョンを指定
    }
  }
  provider "aws" {
  region = "ap-northeast-1"        # AWSのリージョン（ここでは東京）
}
}