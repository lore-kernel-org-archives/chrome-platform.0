Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793164347;
	b=TPn8oLMvQA6eU8cD0wE4GK3YzUYYOQJQkWLq+mgH/I11m67JbMGllb77NsX9cZMvOdCT
	 DXZKNZR4gUQYZFtxhm8Lh8VdYPwHZy7SEnwGql3CM3oJGYZzrYgY4lUp1NkzPQwEmswNb
	 4JO+P7R2jEA20rAJee4Za0uDIH2NeNfEqWF2f0gimUg3ZLUY1O0+kh3i1UhRbBoeA50R/
	 k+oDZXHsK61MDAjMyUJfsYUZNJKzfQ8waWu9fBBMZ9reMGTp68+KlYch/Tik9Z20ZC1Ek
	 MpLp8PAd68kKmUn6cJhQ7UcggqquXhVoDm9XNDiXVX+PqBBAgC2WMV2LdDQbjVVvomA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164347;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=nYsLqUlsjGDEPJYA9NcU3HBE54LgzTei1eQnGwkc7PU=;
	b=0MFJxrr+MuT/PL5PBuJyedZekMA1B49Ij8CAf42qGtz7fHg5nzBGP49IuNokwnO5idRF
	 xgDT62Q1gmMIM76IzvYUycmAn+nHWwRhvb5wNXeIg5bbxonmWxcuGS7jbprTYgkd9QIRl
	 XYJcVkxu1bmI+GOi2FK5Ltld8A3s6pHfwjgp0us46IHWSoVdSOQNf7WF883ZZdkkQ6uf5
	 0+RzJjhj1QNSYRVpYzfVzw5ie2JFPNUcKwHOa6ZXgt+wSLHt90v1YRNeYPhYdRkOKnSCZ
	 ZS/xPwVmdlDOu+QXqliJZ5YrbfmJg+z2YlK0V4TwDpkZ+tRkFYovmMUIhw+4Zpck3wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fV6ZoNem;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5783606A31D
	for <chrome-platform@lists.linux.dev>; Wed, 28 Oct 2026 05:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5783606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fV6ZoNem
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nY
	sLqUlsjGDEPJYA9NcU3HBE54LgzTei1eQnGwkc7PU=; b=fV6ZoNemMxZy4Ah159
	PZBM02gXW0Z2/UKU2yRq1Z66OwflrcCSjUyzqU7HrJWCUBBFY31pLbiAJ7bLk/f4
	BhCOjH0mo/GfaTcPNCmnw2Jj2W9ty4flrfx0WSdu8aj7MKfPkgqs+IyP/SgQDFX+
	X9r0F6mNcZ9UuLeB1eYJUYnso=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDX_wMghOFq5BQxDg--.58804S4;
	Wed, 28 Oct 2026 13:12:02 +0800 (CST)
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
Date: Wed, 28 Oct 2026 13:12:00 +0800
Message-Id: <20261028051200.145621-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028051200.145621-1-yaojiale02@163.com>
References: <20261028051200.145621-1-yaojiale02@163.com>
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
X-CM-TRANSID:_____wDX_wMghOFq5BQxDg--.58804S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrWxJFWDGryDGrW7Jr4rAFb_yoWkXrgE9w
	s7uF4xArn5Kr1kKr1Yyrn3ury3Krn8tr1fKFnagr1ay3s5JryxXFyqva4Dur4rJF9xZrnx
	Jw4UWrsa9F1SyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU81qcUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wM8dmrhhCMLYAAA3h

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

