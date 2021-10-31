class Des
    #定义常量
    ALG = 'DES-EDE3-CBC'
    #你的密钥，可以自己设定
    KEY = "5iLuoPan"     
    #任意固定长度为8的值
    DES_KEY = "XWERDFGS"          
    #加密方法，之后我们调用Des.des_encode(password)就能对密码进行加密
    def self.des_encode(str)
      des = OpenSSL::Cipher::Cipher.new(ALG)
      des.pkcs5_keyivgen(KEY, DES_KEY)
      des.encrypt
      cipher = des.update(str)
      cipher << des.final
      #进行Base64编码，才能保存到数据库
      return Base64.encode64(cipher).gsub(/(^\s*)|(\s*$)/, "") 
    end
  
    #解密方法，登录的时候调用
    def self.des_decode(str)
      str = Base64.decode64(str)
      des = OpenSSL::Cipher::Cipher.new(ALG)
      des.pkcs5_keyivgen(KEY, DES_KEY)
      des.decrypt
      des.update(str) + des.final
    end
  end  