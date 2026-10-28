Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793164289;
	b=hMige0tUxdCYM6uU6IlPm41t/85aK6kLu8HGGAXHN+RE9KNY7QC/z/MPBZ5wr+FHfLzb
	 KO7g3LkYlmqm9CxIvZEdIbnbib0th2+ayKaRluLeV3n/0EkG3hFWxpDccEs2uNKZvMG4k
	 lGOLRX7uUMnBjJut1+REniS7hVmNdQlg5x+qd+FRWm+cgVibThlZAnB952WygNiK/5CQx
	 jua1O+1ngGhnx2OBpeuRA7/XSM06JisB9v6JcOlOie6vHr1xbwyBfDme6bYTiOa5/vEEB
	 20YAGRAzCQyqIdr1P/ss+V/vBgF+OsGYcXSZCXS1xISvADWm6inmCa9TipPX7Sov1/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164289;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=nYsLqUlsjGDEPJYA9NcU3HBE54LgzTei1eQnGwkc7PU=;
	b=2t21L4l5Mhu5+bPD3D2c8eoZJlZSaKDbMgBWsHZKNiZWgVYIvgit68YYff+qrJ2kt1e9
	 B5uvWJathVe8W/lcnBI1gAeLbUzM4Br9BO5gmEaUYZntjMH6IsI04aq6qMI8YqLR7BsIG
	 Sni6JO7WjuenIPgvuPdVq7Cqh8DDW1ejnzfEcn7farDUsU9kXQgnzZB6ysaERNGchQHsA
	 PwltcSiZCMe0qSyhONp+5mENQonJQ3HPbjIlV0ouypgtmh2v58swKdCkQqfRiMyXeq+M2
	 kwCOwYZkIRHrPny2e685GVRQKIYRxzVfXr7E7nvS/kOd7MZJwS57JfhvZqn3SvjwJ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eMsD6tmn;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6306B606A326
	for <chrome-platform@lists.linux.dev>; Wed, 28 Oct 2026 05:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6306B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=eMsD6tmn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nY
	sLqUlsjGDEPJYA9NcU3HBE54LgzTei1eQnGwkc7PU=; b=eMsD6tmnGUEywxZmTu
	LNzSoXZpZnM7WLRAC/o9T6sIXdMH0GpvCmV2D1BnTQHTVzm6bJ/pZNySwHx7q0e3
	IYo8fzhACrPx0d9oYg0GkscEoumw+KN19aR3TIfaPPLU+4/5xVEDXWAHeJYIoVQx
	+kG+DbYYxkeIE+XS5ny92gW5Y=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnr6Tlg+Fqeq+RDQ--.25782S2;
	Wed, 28 Oct 2026 13:11:01 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 2/2] platform/chrome: cros_usbpd_notify: check ACPI companion
Date: Wed, 28 Oct 2026 13:10:59 +0800
Message-Id: <20261028051059.143646-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnr6Tlg+Fqeq+RDQ--.25782S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWxJFWDGryDGrW7Jr4rAFb_yoWkXrgE9w
	s7uF4xArn5Kr1kKr1Yyrn3ury3Krn8tr1fKFnagr1ay3s5JryxXFyqva4Dur4rJF9xZrnx
	Jw4UWrsa9F1SyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbIPfJUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQUtZ2rhg+XTfQAA3B

The ACPI probe installs a notification handler through the device ACPI
companion without checking that the companion exists. A force-bound
platform device can therefore cause a NULL pointer dereference.

Return -ENODEV before allocating probe resources when the companion is
missing.

Fixes: 7e91e1ac60bb ("platform/chrome: cros_usbpd_notify: Amend ACPI driver to plat")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/platform/chrome/cros_usbpd_notify.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_usbpd_notify.c b/drivers/platform/chrome/cros_usbpd_notify.c
index 25da31ec1996..1d82c74583cb 100644
--- a/drivers/platform/chrome/cros_usbpd_notify.c
+++ b/drivers/platform/chrome/cros_usbpd_notify.c
@@ -105,6 +105,8 @@ static int cros_usbpd_notify_probe_acpi(struct platform_device *pdev)
 	acpi_status status;
 
 	adev = ACPI_COMPANION(dev);
+	if (!adev)
+		return -ENODEV;
 
 	pdnotify = devm_kzalloc(dev, sizeof(*pdnotify), GFP_KERNEL);
 	if (!pdnotify)
-- 
2.34.1

