# Metadata for static library jurl/native.a

{ :cpp false
  :ldflags (quote ( "-lcurl"
      "-lssh2"
      "-lssl"
      "-lcrypto"
      "-lcrypto"
      "-lz"
      "-lidn2"
      "-lunistring"
      "-lbrotlidec"
      "-lbrotlicommon"
      "-lzstd"
      "-lgssapi_krb5"
      "-lkrb5"
      "-lk5crypto"
      "-lcom_err"
      "-lkrb5support"
      "-lssl"
      "-lpsl"
      "-lssh2"
      "-lssl"
      "-lcrypto"
      "-ldl"
      "-pthread"
      "-lz"
      "-lnghttp2"
      "-lnghttp3"))
  :lflags (quote nil)
  :static-entry "janet_module_entry_jurl_47_native"}