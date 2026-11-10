Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347789;
	b=c7AcLJgpk+uQiG+qth73tMUZyb0XB/u9tLK4p2TN6iqrvx8nLMaAAwd1BxvUJ/ToeReM
	 KwAHFNoydEvt3NnWYVMH427Xb0vCny1dR5BGNxOEbFP8Wxk5nex135wEDCcDViDNZZmqI
	 KkmctV3hBtQW21ZPqS0XfMKgP9S0XaDutHKTgqojqHfcyAIGJv5pnr5yoR357eNArnFr7
	 bIhdwTNBwzqUFzMqwdOSoOXhdGrweFENmr23frtNVUbkq2/3wdwcWazWAMC5Tr+e5rtjJ
	 fTcaqLf76mpJt8wkp2gvgwqoFPMZVigyE08p/otS52w0RRQSUh6DZMcujxY15uOV+vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=3yHxwmGIP00UkCKgkChB+u5krh4ioA+qIXr0cmR6Xmc=;
	b=A54IVVCbW92tjuDSGyckFJPorT1NyeZ/iRRM+u10N9SZ0g4dyu/UO+dEvEmHQg1Esgco
	 2M7iy9jX/rS/74D+j5V+/VYf86FgMsbDAc02kw6eHepSCs6jodsH3+F2KEyMISYw52fFk
	 0519TUOLcQTUU+GBQ1zUBSM/E+A3j5APHZs/RALlojRAMBQu5yMVEMNK2Rffr4lflNZOG
	 cycDUZjUXd0V1uZZSiL4MKhxz0U6yr6QqDlZilxMVXFCcdSRlHJ8Hr+AYfAcR52G6aU0k
	 WkAAxV9eO5iORdgSI65UShz8DzK8Y1fi2oIgySwzxI574tbO8PhApGeJWOD5efnyO5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I5VTBGVm;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D972C606C982
	for <chrome-platform@lists.linux.dev>; Tue, 10 Nov 2026 21:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D972C606C982
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I5VTBGVm
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso18820465e9.1
        for <chrome-platform@lists.linux.dev>; Tue, 10 Nov 2026 13:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347787; x=1794952587; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yHxwmGIP00UkCKgkChB+u5krh4ioA+qIXr0cmR6Xmc=;
        b=I5VTBGVmwxVemQ5e9FTEmZqZvlnK6MAXrPOfW6GXu3jfjvhZmef0j9VTZI+PveEq9D
         S9DZsN7XsB8tQh4ACYPMdtsdvy7PlVP5F0uk+C+gN9mOOwQXBPIyzSB+3R3dGlVkgOxX
         PwH2i3H8ol0fe6otrww0hBcNbfeAcB1qpRTkgkXWLITssZU9YiJKS061nE8/Ec44hH/h
         Wj/MNLkvNXn0pTwXsEIdI06RjAiBMuSHmZpQqJO8UiG8/vxxIwIqfccJiqc+NPyuPvtw
         EaU2lfrBCcAyRe/0ZvNkxaR6+eLdqTGGIORXxgp/sgP7P8RU35FIvpd+sCtqCKwwiWpJ
         n0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347787; x=1794952587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yHxwmGIP00UkCKgkChB+u5krh4ioA+qIXr0cmR6Xmc=;
        b=VK8mUMM5DLj4rVH+HQuADYpAXhtdK8kaoI3SyD0vD0kV0m8DrewAqOC1Z1ag3mkrTg
         +qX+e3goQ3ybd8Oap8mx8sj9SJ5Y6re4WhJPtqIcS2rhVv4C0ThMp3/bTqkT3KWzdD4C
         WBqKZpE7BbgyDJDwLYoWT2XQ49R9U/LO3TEUR92OCHnLTuRoeBxfabTjfgmnxJYTg+Q1
         0SlUzvf1B4F3MsfIV9JLQJyRTyTjwiIenr7JwvndSHP7GEXOyjrkPaYtRq1oSDH9NWqg
         BUB8SjaHj7wGG5mYQ6Ux/4nq5+gLFsMxmQx9sHQtEHdNo/Wyy1yWuV+d0sQhzGRwMCCM
         TaRg==
X-Forwarded-Encrypted: i=1; AL+hErHFOtaigYDq/el/ppaJisq3M0ym+GdUqhoN9FdIxXvx/oQsJjS3BrPzG3eGvSDlxmnj77zK6mZ2eK+quP5QvQY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/z8elYXyXQS9CRDrp7fPL/U7bB/IxkVYULHDPNIjcWe2DuLdpd
	PXIVyZL5sEMNGQaVgNUiIw3jC+w4K5/9RZ90TXAj4c4HnmJz6J8v0VBzP7VMUUgtNz0=
X-Gm-Gg: AYBFou0i6A0Idh5XUUH+ybKLSCdZtTLuqfGXIpIayoy0fxpv0PYYnkLSFu7kLp+/l7N
	1bzlq2wu0jtuCiHvf8Qe2P6guIUJt8AF7nWCQgnYvwIU2YXM5joImXa+Hipw6JAoAq3F/X10+4T
	retznRy620r+BKCSUa6J5ZBC9rIJBJx58BQXWZ8IrLXe3o/w9TJ4DeI5W4DpsspMeOo4RXze4WZ
	kNItjxURSdOprOV9rYLwj9J1mb70Wt3r3rjEH6vr3JiKg2Ie8ZuqlhvtcydilUp8z9ZfxASuoH1
	1QfKEhJP05EHX8L+PNWAEN9+RAoRM/hBAU3PQKSnTgfQ7S2dniFBVrvrtGWPUKycnNMQWa4N+v/
	4ooKVvc/cTs2v0Q5L9urHgD+Mf0n6QKGkZ7FdE2S2KxL7ZZPHUibmraBAF1oEXT+PMItea4Ag3q
	BMkqAbypXrYp1zjfm41u/UoX9HHUIpwLRDSvRepOv6ybr0eww/5LAbJ+AThNE6NP8yLgWxPuSnL
	70zZH9J+kwOYw985AwsHOrV9YaUkvhkSTrciSfqUur8FAMMeLAy7uXAlRfIGR8QKIG20veYoeFs
	N2ONoL2iZQPanvamOOgapHPEWzRJuyNyTg==
X-Received: by 2002:a05:600c:83cf:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4ba0935cc7fmr6834225e9.11.1794347787385;
        Tue, 10 Nov 2026 13:56:27 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fe9357sm104638115e9.9.2026.11.10.13.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:26 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 15/20] mfd: Use named initializers for platform_device_id array
Date: Tue, 10 Nov 2026 22:54:40 +0100
Message-ID:  <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2610; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=GtAPN5RJoz25rnsaMIkCchglusimHC6pNuburCmgGRg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85LIi8QM3sjZgogwtug7vcVX0SJ3+X0vaVym+ L1HdZB2sE+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSyAAKCRCPgPtYfRL+ TmYhCACII9zsLdrs/XbNbp5plwyC1+ueOodgi90o8Ine575DtEGWJWFKxuOyV3MjOikDIUogOsG MzJmZ24/rTI7I4xwYZlkYEAqHwAGYW8EMjWiQpKt5XO8wsAFYIxFSL8LTY71t74mgHbWDhNI+8w 2TxE30D1nc84pn3rOgSAECQGKJdmFQ2ypL3quSOgUzff6KmjPytCYfR+0y/C9BOwmXcw28lKsDc mkicJ29/gVaaf9mRn6Qtjl2QU/WU4d3KO3rTHSnwNDd0A7kyku+SPqvzMsCcRe+ONI4Alw7KzMt c3E3M48lKlrj231S7RpIbK24VOHABh3tP5EwFKaeE7IzoPbd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
platform_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Also drop a tailing comma after a list terminator to match the common
style for these device-id arrays.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++----
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index d5602b2f4a0e..8638fc8472f7 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1252,10 +1252,10 @@ static int ab8500_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id ab8500_id[] = {
-	{ "ab8500-core", AB8500_VERSION_AB8500 },
-	{ "ab8505-core", AB8500_VERSION_AB8505 },
-	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
-	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
+	{ .name = "ab8500-core", .driver_data = AB8500_VERSION_AB8500 },
+	{ .name = "ab8505-core", .driver_data = AB8500_VERSION_AB8505 },
+	{ .name = "ab9540-i2c", .driver_data = AB8500_VERSION_AB9540 },
+	{ .name = "ab8540-i2c", .driver_data = AB8500_VERSION_AB8540 },
 	{ }
 };
 
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 96aac158fd8b..3c7e7f1efd0f 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME },
+	{ .name = DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index e74936ac206f..385121867da5 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -435,8 +435,8 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397" },
-	{ },
+	{ .name = "mt6397" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
 
-- 
2.56.0.rc1

