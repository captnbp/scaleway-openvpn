host_ipv4_dns () {
    sed -nr 's:nameserver[ \t]([0-9\.]+):\1:p' /etc/resolv.conf | tr $'\n' ' '
}

export server_name='myvpn'

# these prefixes will be used by the wrapper script to bind subnets to instances
# the first server would have fd00:d34d:b33f:0000::0/64 and 100.64.0.0/24
# the second one would have   fd00:d34d:b33f:0001::0/64 and 100.64.1.0/24
# the ipv6 prefix must be 48 bits long
# the ipv4 prefix must be 16 bits long
export ipv6_prefix='fd42:5ca1:e3a7'
export ipv4_prefix='100.64'

export ipv4_dns_servers="$(host_ipv4_dns)"

export easyrsa="/etc/openvpn/easy-rsa"
export easyrsa_keys="${easyrsa}/pki"

export openvpn_tls_version_min='1.3'

# TLS 1.3 encryption settings
export openvpn_ecdh_curve="secp384r1"
export openvpn_tls_ciphersuites='TLS_CHACHA20_POLY1305_SHA256:TLS_AES_128_GCM_SHA256'

# TLS 1.2 encryption settings
export openvpn_tls_cipher="TLS-ECDHE-ECDSA-WITH-CHACHA20-POLY1305-SHA256:TLS-ECDHE-RSA-WITH-CHACHA20-POLY1305-SHA256:TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256:TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256"

export openvpn_cipher='AES-128-GCM'
export openvpn_auth='SHA256'

export ipv4_net="${ipv4_prefix}.0.0/16"
export ipv6_net="${ipv6_prefix}::0/48"