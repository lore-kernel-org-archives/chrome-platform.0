Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE4D2ECEA5
	for <chrome-platform@lists.linux.dev>; Mon, 27 Apr 2026 13:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777295860; cv=none; b=bG1SR92nlI60bIGZqzvIUklMfi1MK8GzLI+ar45i5DoBikOe9dHxgp8brE5KeZQpwVn4a8TCSPQL0FvT93rHXGgQOB1/EMfOEXL1X1G7+c8a/fRJXZTXfpITAzdk8Zmfl0lOrUF+OSZGCg4gck/fy6+TxVxwqDR9oOkPq8ccOMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777295860; c=relaxed/simple;
	bh=0V6gosJdoRQNTFQqh2+bD0+xQoMNzeLU3Tbf4QclE5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qQS9s2AQVFRfLe4YcmDAKxpTcTdtxKLJLf0RjN1+ND8Ukb+DOEnDaLKPMN/hjLsCQt42cplla1HrMM1eZCQfMGRtuDWTAyg/f9HwZyL48aLDZrNZ0Q1ATkNpbZjxV+IpQfnU1d/h4ikM+eA7ffgR6PqBnU6stoQBz8zPLL1edx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZanH5E+m; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZanH5E+m"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-baebe98afa0so338918666b.3
        for <chrome-platform@lists.linux.dev>; Mon, 27 Apr 2026 06:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777295857; x=1777900657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UdxTgo2BiNPwM4INja+PgXdaGRXgDFW+qwgof2SUt84=;
        b=ZanH5E+mtskVv2IrBFkKoLJxe4dX4oMdrLcptsw94u34pn4s7F3EWWz0AAfoMIeJC/
         QsU9M1sL7ycTPM6YQ8fC2J8vbBpwIbmWTcdwfRlIxNRDNmgroHmYVahnX53RpS2uwb9n
         ykBdwhRphMHRLVHUOIJhT+Tj+po2PvFioIPLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295857; x=1777900657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdxTgo2BiNPwM4INja+PgXdaGRXgDFW+qwgof2SUt84=;
        b=cVZf4aoBfD6J7q6GOD93MipMVINksRKq2d8MHKbxNNPrM9Lmcb1+Ocet+JAeeOsg+R
         xct+vpj7nh4jiuxmWhN4Sr9XEVOJMjUI06yCIKjRHu3BlNjOkKEeteaH9SE0ENFAE3Oe
         M+/hEZaOsSI3IA8XKtLMhy4rUXrUGmJgB9K7y3+e5RwPglY6u7mVtT+m5GrZoz+CW0NE
         Xr7dyaGvHGfRBW47e6VBBCprPsz1vRPmCYmmYKUsB/gfYAlhovr72NyfHxz9e9SBPA6u
         7iMsksAP5ElSX8WEfE+7GS/7cY1QPzMi39nO0qYwIHJDiVihRXlYxDyaFu0jz/KTsq2i
         SDdA==
X-Forwarded-Encrypted: i=1; AFNElJ9kTrdm41nCQs/xXeQMa754sVXEMK4XC4WxasDjCnRi8US2Knr22WwXm3Fy6M/fHnL5cOry+k9u1DHGD3Wqu5g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlD+wl1yYZ7WNLg6t0UtQoiQfQTHWlyZNT4VqXOKc+15WEcFg1
	iupES7aNNYqaSXQ0SVTLRSdM0ZcqxxQeXdrAs771fo6NNNO84t9RkYa1q+cjgblYfA==
X-Gm-Gg: AeBDietGp6MWj9Xan2Qo0bK2DPmbcFx2OipFFPf9qqmO+UvLbfgziRiqZ60L0ZZ2Ycc
	35y/ytgLFnaa0/b716MRoQj8PPtkk6rAANxOZS9s4Lj6B9Chb6yGfR6gwGO081wqI+6z7cdFrZN
	yXVZ8W96MKvUf9+TjCFKgW7nLNkKwWwsG7xl1Z561r5Vu/wsghtrXTqImi8IOuF8GJGpZ+JACfG
	AccrM0J59k3R9LlYJrIJKIeqqV1+oZzr/6uhPVnzAoMtzz7wCfQWfu3MJ7hEFBSir/cHB+f3UMm
	FpSQMr22jhLN1+6HdaNzqc4TvTDDtyq2ZPN4FV0YVmVP4EjErr8ksof5JY7MBZcMDiRBY9ptQwz
	UP6AFX00sWwdB208mlpYrjgG96SUMtsYuayqJwWH0u8lRdK8X4DzmmWUUaL6A9SLx7NgLSM0sUi
	dtX72fXWzFdWq5o4BVZtS39wkiWW/eNzgS9c0G5haKMSL28GH1qHysJHwkFb0mIM+ovBE7+2Sox
	M/1biFP1/45as/xpwLaBmgw9tmPIC3nDQ==
X-Received: by 2002:a17:907:3cca:b0:ba6:a05c:ac2b with SMTP id a640c23a62f3a-ba6a05cb665mr1754584166b.18.1777295856940;
        Mon, 27 Apr 2026 06:17:36 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (124.143.141.34.bc.googleusercontent.com. [34.141.143.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1db07sm1135196166b.30.2026.04.27.06.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 06:17:36 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Logan Gunthorpe <logang@deltatee.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH] mfd: cros_ec: Delay dev_set_drvdata() until probe success
Date: Mon, 27 Apr 2026 13:17:21 +0000
Message-ID: <20260427131721.1165078-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If ec_device_probe() fails, cros_ec_class_release releases memory for the
cros_ec_dev structure. However, because the drvdata was already set,
sub-drivers like cros_ec_typec can still retrieve the stale pointer via the
platform device. This leads to a use-after-free when cros_ec_typec attempts
to access &typec->ec->ec->dev on a device that has already been released.
Move dev_set_drvdata() to ensure that the pointer is only made available
once all initialization steps have succeeded.

 sysfs: cannot create duplicate filename '/class/chromeos/cros_ec'
 Call trace:
  sysfs_do_create_link_sd+0x94/0xdc
  sysfs_create_link+0x30/0x44
  device_add_class_symlinks+0x90/0x13c
  device_add+0xf0/0x50c
  ec_device_probe+0x150/0x4f0
  platform_probe+0xa0/0xe0
 ...
 BUG: KASAN: invalid-access in __memcpy+0x44/0x230
 Write at addr f5ffff809e2d33ac by task kworker/u32:5/125
 Pointer tag: [f5], memory tag: [fe]
 Tainted : [W]=WARN, [O]=OOT_MODULE
 Hardware name: Google Navi unprovisioned 0x7FFFFFFF/sku0 board/sku3
 Workqueue: events_unbound deferred_probe_work_func
 Call trace:
  __memcpy+0x44/0x230
  cros_ec_check_features+0x60/0xcc [cros_ec_proto]
  cros_typec_probe+0xe8/0x6e0 [cros_ec_typec]
  platform_probe+0xa0/0xe0

Cc: stable@vger.kernel.org
Fixes: 1c1d152cc5ac ("platform/chrome: cros_ec_dev - utilize new cdev_device_add helper function")
Co-developed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/mfd/cros_ec_dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 39430dd44e30c..56fb7cceafc6c 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -195,7 +195,6 @@ static int ec_device_probe(struct platform_device *pdev)
 	if (!ec)
 		return retval;
 
-	dev_set_drvdata(dev, ec);
 	ec->ec_dev = dev_get_drvdata(dev->parent);
 	ec->dev = dev;
 	ec->cmd_offset = ec_platform->cmd_offset;
@@ -237,6 +236,8 @@ static int ec_device_probe(struct platform_device *pdev)
 	if (retval)
 		goto failed;
 
+	dev_set_drvdata(dev, ec);
+
 	/* check whether this EC is a sensor hub. */
 	if (cros_ec_get_sensor_count(ec) > 0) {
 		retval = mfd_add_hotplug_devices(ec->dev,
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog

