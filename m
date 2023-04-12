Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467B3364
	for <chrome-platform@lists.linux.dev>; Wed, 12 Apr 2023 00:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ENNo4iectvYsmfO0kcRpq1kVjNNnqzFUNstY4b5BCLY=; b=U
	cyBR/w1AO4PEyqsQ63A30/WbCQiXXF+SQ+++1VjhYXVZNEWXeNImQyDbAKTizvax
	TpTSFtoDtnCjidYgHgCVVG9K53cteVe168c8T5UrW3dqSu2WReIzTi8pihWRzE4n
	e8hIc+ZZOqD0PER8pkgXohFk8K7tMZpPsKlv4leUK4=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr24
 (Coremail) ; Wed, 12 Apr 2023 08:26:54 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date: Wed, 12 Apr 2023 08:26:54 +0800 (CST)
From: "Liang He" <windhl@126.com>
To: "Prashant Malani" <pmalani@chromium.org>
Cc: bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev
Subject: Re:Re: [PATCH] platform/chrome: cros_ec_typec: Add missing
 fwnode_handle_put()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 126com
In-Reply-To: <CACeCKacsy5tbSFATgtsDYfAJi68ExpbJDBGv2Z0K4N-dC7H8aA@mail.gmail.com>
References: <20230322041054.1856718-1-windhl@126.com>
 <CACeCKacsy5tbSFATgtsDYfAJi68ExpbJDBGv2Z0K4N-dC7H8aA@mail.gmail.com>
X-NTES-SC: AL_QuyTA/6etkoq4iidYukXnUwQg+s/UMW3vfgg2oZVNp80kSnV2w09XV98JGvw4f+jDzuikDixbSpy1dZaZ5tIQKb0+lWb2lsCsXpTP+kQVbpH
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <12078fa5.471.18772dbb80b.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:GMqowAB3h8_Q+jVkzHIKAA--.65317W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBlOF2JVmnFNygABsi
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CgpBdCAyMDIzLTA0LTEyIDA0OjMwOjM1LCAiUHJhc2hhbnQgTWFsYW5pIiA8cG1hbGFuaUBjaHJv
bWl1bS5vcmc+IHdyb3RlOgo+SGkgTGlhbmcgSGUsCj4KPkNhbiB5b3UgcGxlYXNlIHJlc2VuZCB0
aGlzIHBhdGNoPyBJIGRvbid0IHNlZSBpdCBpbiBwYXRjaHdvcmsgb3IgdGhlCj5tYWlsaW5nIGxp
c3QgYW55IG1vcmUuCj4KPlRoYW5rcyEKPgoKSSB3aWxsIHJlc2VuZCBub3csIHRoYW5rcyBmb3Ig
eW91ciB3b3JrIG9uIG15IHBhdGNoLgoKTGlhbmcKCj5PbiBUdWUsIE1hciAyMSwgMjAyMyBhdCA5
OjEx4oCvUE0gTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPiB3cm90ZToKPj4KPj4gSW4gY3Jvc190
eXBlY19pbml0X3BvcnRzKCksIHdlIHNob3VsZCBhZGQgZndub2RlX2hhbmRsZV9wdXQoKQo+PiB3
aGVuIGJyZWFrIG91dCBvZiB0aGUgaXRlcmF0aW9uIGRldmljZV9mb3JfZWFjaF9jaGlsZF9ub2Rl
KCkKPj4gYXMgaXQgd2lsbCBhdXRvbWF0aWNhbGx5IGluY3JlYXNlIGFuZCBkZWNyZWFzZSB0aGUg
cmVmY291bnRlci4KPj4KPj4gRml4ZXM6IGZkYzZiMjFlMjQ0NCAoInBsYXRmb3JtL2Nocm9tZTog
QWRkIFR5cGUgQyBjb25uZWN0b3IgY2xhc3MgZHJpdmVyIikKPj4gU2lnbmVkLW9mZi1ieTogTGlh
bmcgSGUgPHdpbmRobEAxMjYuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvcGxhdGZvcm0vY2hyb21l
L2Nyb3NfZWNfdHlwZWMuYyB8IDEgKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL2Nocm9tZS9jcm9zX2VjX3R5cGVj
LmMgYi9kcml2ZXJzL3BsYXRmb3JtL2Nocm9tZS9jcm9zX2VjX3R5cGVjLmMKPj4gaW5kZXggMmE3
ZmYxNGRjMzdlLi4zYTI0MmVmZmM4NWQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0v
Y2hyb21lL2Nyb3NfZWNfdHlwZWMuYwo+PiArKysgYi9kcml2ZXJzL3BsYXRmb3JtL2Nocm9tZS9j
cm9zX2VjX3R5cGVjLmMKPj4gQEAgLTQ0Myw2ICs0NDMsNyBAQCBzdGF0aWMgaW50IGNyb3NfdHlw
ZWNfaW5pdF9wb3J0cyhzdHJ1Y3QgY3Jvc190eXBlY19kYXRhICp0eXBlYykKPj4gICAgICAgICBy
ZXR1cm4gMDsKPj4KPj4gIHVucmVnaXN0ZXJfcG9ydHM6Cj4+ICsgICAgICAgZndub2RlX2hhbmRs
ZV9wdXQoZndub2RlKTsKPj4gICAgICAgICBjcm9zX3VucmVnaXN0ZXJfcG9ydHModHlwZWMpOwo+
PiAgICAgICAgIHJldHVybiByZXQ7Cj4+ICB9Cj4+IC0tCj4+IDIuMjUuMQo+Pgo=
