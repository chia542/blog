terraform { 
  cloud { 
    
    organization = "aws_blog" 

    workspaces { 
      name = "aws_blog" 
    } 
  } 
}