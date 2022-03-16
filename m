Received: from gateway31.websitewelcome.com (gateway31.websitewelcome.com [192.185.143.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A081F38F5
	for <chrome-platform@lists.linux.dev>; Wed, 16 Mar 2022 19:13:37 +0000 (UTC)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
	by gateway31.websitewelcome.com (Postfix) with ESMTP id 34AAE4AD60
	for <chrome-platform@lists.linux.dev>; Wed, 16 Mar 2022 13:49:48 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with SMTP
	id UYiRnWjmsRnrrUYiSn1PST; Wed, 16 Mar 2022 13:49:48 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8ZZMJMbNtgYc56X67LL9KdeIFKoyOX1wV88R9FlIc0I=; b=EfTfWx9izJAciLjkn5M67lD8I8
	xzCbZQxSN0Y6em7MI8lWnpKAffip0diTrz2K1u7hJrl7X37LFv/bGI59UxNt4mVmFyIz8at33mzkj
	fNsRwhDN0QeHJWaeKcPkpfBjeLheJFKAqf9AsT/abdAkAxoRUMJoDryyGFmJi+XRVisEqSfdM1Np5
	EE1P9/7fmjumR7mtgUx+g1uA3Kq6JTVMb9XBK92FEtS4T7U6uA52TOTXLjduNTWw+PRZ2WzQTTjIF
	DSk3SvkanjTjyxwlzSuj9jJ9ZwLX4VcCdMskh27AipX7jVa155m1v8vlQnpKlTXz8YU1ajIHLVkL5
	nD+YLQBw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57502 helo=localhost)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@roeck-us.net>)
	id 1nUYiR-00474M-CN; Wed, 16 Mar 2022 18:49:47 +0000
From: Guenter Roeck <linux@roeck-us.net>
To: chrome-platform@lists.linux.dev
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rajat Jain <rajatja@google.com>
Subject: [PATCH] MAINTAINERS: Add chrome-platform@lists.linux.dev to all Chrome OS entries
Date: Wed, 16 Mar 2022 11:49:45 -0700
Message-Id: <20220316184945.452379-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nUYiR-00474M-CN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57502
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes

Add the chrome-platform@lists.linux.dev mailing list to all Chrome OS
maintainer entries to ensure that people copy the list when submitting
Chrome OS specific patches. This also helps ensuring that patches are
available in a patchwork instance.

Cc: Benson Leung <bleung@chromium.org>
Cc: Rajat Jain <rajatja@google.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e127c2fb08a7..bc275698e7c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4541,6 +4541,7 @@ F:	drivers/input/touchscreen/chipone_icn8505.c
 
 CHROME HARDWARE PLATFORM SUPPORT
 M:	Benson Leung <bleung@chromium.org>
+L:	chrome-platform@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
 F:	drivers/platform/chrome/
@@ -4549,6 +4550,7 @@ CHROMEOS EC CODEC DRIVER
 M:	Cheng-Yi Chiang <cychiang@chromium.org>
 M:	Tzung-Bi Shih <tzungbi@google.com>
 R:	Guenter Roeck <groeck@chromium.org>
+L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
 F:	sound/soc/codecs/cros_ec_codec.*
@@ -4556,6 +4558,7 @@ F:	sound/soc/codecs/cros_ec_codec.*
 CHROMEOS EC SUBDRIVERS
 M:	Benson Leung <bleung@chromium.org>
 R:	Guenter Roeck <groeck@chromium.org>
+L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/power/supply/cros_usbpd-charger.c
 N:	cros_ec
@@ -4563,11 +4566,13 @@ N:	cros-ec
 
 CHROMEOS EC USB TYPE-C DRIVER
 M:	Prashant Malani <pmalani@chromium.org>
+L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/platform/chrome/cros_ec_typec.c
 
 CHROMEOS EC USB PD NOTIFY DRIVER
 M:	Prashant Malani <pmalani@chromium.org>
+L:	chrome-platform@lists.linux.dev
 S:	Maintained
 F:	drivers/platform/chrome/cros_usbpd_notify.c
 F:	include/linux/platform_data/cros_usbpd_notify.h
-- 
2.35.1

