# aws_lightsail_key_pair: インスタンスにアクセスするためのSSHキーを作成
resource "aws_lightsail_key_pair" "wordpress" {
  name = "wordpress_key"
}

# aws_lightsail_instance: Lightsailインスタンスを作成
resource "aws_lightsail_instance" "wordpress" {
  name              = "wordpress"            # インスタンス名
  availability_zone = "ap-northeast-1a"      # 使用するアベイラビリティゾーン
  blueprint_id      = "wordpress"            # WordPressのテンプレートID
  bundle_id         = "micro_2_0"            # インスタンスのサイズ（ここではmicro）
  key_pair_name     = aws_lightsail_key_pair.wordpress.name  # 先ほど作成したSSHキーを指定
}

# aws_lightsail_static_ip: Lightsailの静的IPを作成
resource "aws_lightsail_static_ip" "wordpress" {
  name = "wordpress_ip"
}

# aws_lightsail_static_ip_attachment: 静的IPをインスタンスにアタッチ
resource "aws_lightsail_static_ip_attachment" "wordpress" {
  static_ip_name = aws_lightsail_static_ip.wordpress.id
  instance_name  = aws_lightsail_instance.wordpress.id
}
