# What's this?

A very minimal Postfix image for Docker with relay support.
It provides outbound SMTP only, to get mails out of Docker.
The image is optimized for size (< 10MB) and simplicity.

## Usage

Start Postfix standalone (to send emails from containers)

    docker run --rm --name=postfix \
        -e  MTP_HOST=foo.com \
        dnknth/alpine-postfix

Or use a remote relay server:

    $ docker run --rm --name=postfix \
        -e MTP_HOST=foo.com \
        -e MTP_RELAY=smtp.gmail.com \
        -e MTP_USER=foo \
        -e MTP_PASS=secret \
        dnknth/alpine-postfix

Send emails:

    docker exec -it postfix mail foo@bar.com

## Supported environment variables

* `MTP_HOST`: The `myhostname` parameter specifies the internet hostname of this mail system (localhost)
* `MTP_DESTINATION`: The `mydestination` parameter specifies the list of domains that this machine considers itself the final destination for.
* `MTP_BANNER`: The `smtpd_banner` parameter specifies the text that follows the 220 code in the SMTP server's greeting banner.
* `MTP_RELAY`: The `relayhost` parameter specifies the default host to send mail to when no entry is matched in the optional transport(5) table.
* `MTP_RELAY_DOMAINS`: The `relay_domains` parameter restricts what destinations this system will relay mail to.
* `MTP_PORT`: The `relayhost` port
* `MTP_USER`: The user used to connect to the `relayhost`
* `MTP_PASS`: The password used to connect to the `relayhost`
* `MTP_INTERFACES`: The `inet_interfaces` parameter specifies the network interface addresses that this mail system receives mail on.
