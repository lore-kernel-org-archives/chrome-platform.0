Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB5A3AFD11
	for <chrome-platform@lists.linux.dev>; Tue, 19 May 2026 15:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203310; cv=none; b=lNWGJ7hyWOdXgiaNrWPaBRvCCjNdoJOCb/3dUrbV9BXs/bhRJW2LvhJrK82NsmWEmMvCqKTXL5K3Ivdfa+BZl2nP/kFKSXDJRmIp5NLKMLuqgcBvkNwdUeilr+P8gBWpvD7jlMxBmeR06BfSaDQ/saSbqqjxXb3Fxpec840TIEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203310; c=relaxed/simple;
	bh=gIyTbMVZo8oTivU+L+iUC7MZ0p4vQZ+dB80RhLLIzW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ws3tRhox1xJ+XNnft45CkNEbRzQiVKwDDkENU4jsOmVGu5FX8+Dzis240cei1DdI4WK7ltMZvvQg9tmbxsZzuGjh5IJQ6+DLegdLRpgLRy77ZNxm0z3nDRairqfUMt4dQv9mjHHD8bhLICMM9t3TM6dJqkSCDPMMD5Ir9dM5348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YOxqZUxY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YOxqZUxY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43fe62837baso2092609f8f.3
        for <chrome-platform@lists.linux.dev>; Tue, 19 May 2026 08:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779203307; x=1779808107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZafhjMvS5iVLV8z8KBAbQMcJgUXaOxdh1lGuv0i+yeI=;
        b=YOxqZUxYrs7Hv9mBL6qNSFbj1llam2CqFuVfJiij/MzksM1JHd1xCvWk4Sg8F9gnVg
         dl7wiHd+Q45X+c/8IJ3Lu8RQ4HJJ5aqlhGVx7R30Rwv2bF0X4j6unVPM6igXoNLucuZw
         ePOW8oMetXeHM216g9h26cWJez1y1AzJtQV0A5B94isORkmGEekvnjbZeROoqxCSPEu3
         MJHusWWShzBnhZZEB5klgc7imZIngN/Ek5tpRjCa4NiA9oCKJl9EGDA9ExZZMW8xlmz9
         JIj/oMYHyDXDfVl0G7my52jTMze4Qr2mlizCZJnkX9XzJha/hf9NHY0np8xgvZ+WHKZc
         5Ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203307; x=1779808107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZafhjMvS5iVLV8z8KBAbQMcJgUXaOxdh1lGuv0i+yeI=;
        b=AuWwilhzJyw4NPo1UhfhPZ/gh0yl6N1MG95xMJDAuSKRzFkKIwYtn8YarLH5fuymuu
         JIKSca97P1wb9c72xov4eoRR29siTxo+4LsukbezCFfV2rCHfNRY0+pAeqKvquE2WR9q
         QU7vlu8Vu/FOqDv2O7ZEYlGjOp4uQjcZVuRX0KRaegJDQ7fO0WiV85K1rzSm6z3cQAzv
         +MKCzoYUP0GquA9zxMxNT4kfIA6hTfnRPeoKc7v5N9pbk7Zvd6hPFIpAr4pZ9q9K2Eyi
         DWUXODV+dogS35WMj5Y4T99fU9l7QfjrNFzg0oZfCTWHTTuSAkDDVTU39kXa0dNhVLZc
         TNgA==
X-Forwarded-Encrypted: i=1; AFNElJ8TbKiEw46i4pU2UjHYC1Nq97Qm3SFhhuvF0Fo1EPdbr20FrVRnpuPYPsl+MiILLr3QfHPkmhnyWCPExDCw3HM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yye19Ryc3nvgbuIhM7bkQ+Ub8zeWkqJRgwRQ/OxtrDVRyjDOY16
	SMbEK+KzqOBVfHa0DN1GwcocQbKyB8YY4X3v4uzsDX2wIihnL69+VP1isajQQQjmgBs=
X-Gm-Gg: Acq92OF6o1EfIPMmIurn2HevwI2uERhdm8aUIKyrBC9dHoq4guPks7jRzTwF1vfrFDG
	tCKlu69FQH9bnJVJHYHrqWwfpaDw70qNaGsdFcPUmyqoRP3LTB0EBd07i0AihrGADrJHF8LguuK
	uDJNmMrwB9V/MVlr1gBAOsdezAzIyE8/gF9zflHwoz9l6zNYczK+wLZ5GNfFQs0tSSuBK6eqVcp
	uEAJzv/KmqGMRT+hEYoa3GTyAHynTVOsU7qhEk6TZwAcc2DiK+0SPF+dNqJsl28n3VxGL7MZYGM
	bKJBelMXf8sNS0VH0gqRgNtab+FpYKnad8/qoRBp6+bAiPHxtAfr+L6vrFe3Knfr7lc0LfLlaxp
	56pw99JzqJvEW0ieiZpj/DUZP1eat3IOY1jan8C/SwAZkecWwVjwxMzvW61a3u8tx1A6G0G2IuC
	gO4v9CdBQ2ERMJ37dhNc3okzYVvK172spP+QgROZhV048bvXpFMpHL/7PgRx06yCIHGF9HQtDxp
	9rviX1uEu+Qmro=
X-Received: by 2002:a05:600c:4e47:b0:48e:8345:6f8f with SMTP id 5b1f17b1804b1-48fe632361fmr322914425e9.18.1779203307084;
        Tue, 19 May 2026 08:08:27 -0700 (PDT)
Received: from localhost (p200300f65f47db048a8dfcf61053817f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8a8d:fcf6:1053:817f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45d9e768bcesm48390695f8f.4.2026.05.19.08.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:08:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Dan Callaghan <dcallagh@chromium.org>,
	=?utf-8?b?U2FtaSBLecO2c3RpbMOk?= <skyostil@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] platform/chrome: Use named initializers for struct i2c_device_id
Date: Tue, 19 May 2026 17:08:18 +0200
Message-ID: <20260519150819.1591409-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=gIyTbMVZo8oTivU+L+iUC7MZ0p4vQZ+dB80RhLLIzW0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqDHzjzqz1XSHwHEQwVCZaixXB3ZcRSzu0cnWVd aOtmI6gNzWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagx84wAKCRCPgPtYfRL+ TqWYB/92+bp9+2WuMbMgWbwkMC4YblBdayAHB8zJZuOT0IOt/9GcrbNM92w0uJfEojGGGmGQqDX ZEAJtLGZ6em3rMlAXbWFdmt3T+Eau+0S9B7EPqu3HAPWKDOo5YNVyi7Ku3GnLlpOEgkZQSSI2KC IIzBZgGmuR94aS41sWyCCzaAO6FQ9p9O3sreVkzcPoqGLcrLWQpJFi/pfDoljS1fWKwx2o2LiGH J00xVKpH+/ZAM4fHakAmElYgvl2ZP9r/NVoR89GC4JvCNh1VZKqQfwNqmWs/Yggr5kWE91QulBW PbJ1/6A37/jwA7EaLm1CqWSVq9qxZc2LsHR3pDd3+lg7dQOu
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this patch is part of a bigger quest to use named initializers for
mainly struct i2c_device_id::driver_data to be able to modify
i2c_device_id. See e.g.
https://lore.kernel.org/all/20260518111203.639603-2-u.kleine-koenig@baylibre.com/
for the details.

This patch here isn't critical for this quest, as no driver makes use of
.driver_data, so apart from the better readability this is only about
consistency with other subsystems.

Best regards
Uwe

 drivers/platform/chrome/cros_ec_i2c.c  | 2 +-
 drivers/platform/chrome/cros_hps_i2c.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chrome/cros_ec_i2c.c
index def1144a077e..2f46be4a2756 100644
--- a/drivers/platform/chrome/cros_ec_i2c.c
+++ b/drivers/platform/chrome/cros_ec_i2c.c
@@ -348,7 +348,7 @@ MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
 #endif
 
 static const struct i2c_device_id cros_ec_i2c_id[] = {
-	{ "cros-ec-i2c" },
+	{ .name = "cros-ec-i2c" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cros_ec_i2c_id);
diff --git a/drivers/platform/chrome/cros_hps_i2c.c b/drivers/platform/chrome/cros_hps_i2c.c
index ac6498c593e3..3b9485627831 100644
--- a/drivers/platform/chrome/cros_hps_i2c.c
+++ b/drivers/platform/chrome/cros_hps_i2c.c
@@ -131,7 +131,7 @@ static int hps_resume(struct device *dev)
 static DEFINE_RUNTIME_DEV_PM_OPS(hps_pm_ops, hps_suspend, hps_resume, NULL);
 
 static const struct i2c_device_id hps_i2c_id[] = {
-	{ "cros-hps" },
+	{ .name = "cros-hps" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, hps_i2c_id);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3

