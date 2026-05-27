Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC95365192
	for <chrome-platform@lists.linux.dev>; Wed, 27 May 2026 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894971; cv=none; b=GboUW3xnHzHjefq3M2ge6+786a9Nc5Kz2+D9lCV11QmbsM4tUUC3hvI5iQ41Eyay4t8cdd4VK6garY069IDa/igDa5XxkN/RitJ9jfNVNlJeT9Fp1Pv1EKw2Y6rfRwgtkmnDDqSDgXvmbyUrxGHR+XB3Jt3P03oFby1OlFjQy/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894971; c=relaxed/simple;
	bh=1sxvn/Utzi477+dohvNbU2G9iyzM3qmfnfrWFkCMItY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkTwq4BEXUzQ4tEuHJbo1s9YMS9myODXDzwTgcgffwUL/NOC2daVayJnQGPe4SgYZPY5DAqGCpSc1oNYS1oKpr65PrNAs5WXl3Gy2fhhjouHXwEFh5+89y7oDzNjw6ULIFxxdKYXXSbP1yo2qT0op7z0iITrukHsmMDVR+gCxiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UjOGGG/v; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UjOGGG/v"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d7645adbdso7275691f8f.1
        for <chrome-platform@lists.linux.dev>; Wed, 27 May 2026 08:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779894966; x=1780499766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rj+gcFMQIYsXivdfJpoyTNyRaQnSf5LgQGppXL4g3+Y=;
        b=UjOGGG/vPw2ucgPFOa8zHIoK5xUcuJu9wTa1rDTFQn5cIeGZi7Kudj9Nf/Hs8x9Gvv
         DCMd08TGY1VNYCz4ZmECC+diSh6/wBRbc0sZ87PFzMsNG2R43ymzLJ+6msUn/MER4n5Q
         TRmg8g3t0h5iRr48OyV6TRVDUWa4bXjj/vtHhayMbcsTuZXKt0xwaNWkhhg09PHj054J
         lhtmogKiCrlMEvoH0vxKemR9Yv/tRK5SOgft4kS1sMjtDX27VhVPJJR3rnNmH+ct2iz1
         LLZBwWoacQjLAyA1AqCJbvOMe0snsH4QCkaFSLIhmyN30u5ftZFnC96KFR0tgXGUh7lU
         VeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894966; x=1780499766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rj+gcFMQIYsXivdfJpoyTNyRaQnSf5LgQGppXL4g3+Y=;
        b=C/PbMesNFbqpu65+UJ0uIQCn0tp+Dv6SrAhpr2p5KX6Z57RM9XdrOA7OOv/wQ4REL/
         tfDImrmTauN20UKXZxevfx72HGq5xboaoIqYTPv2gdTIRKOVkfBU3K9MZb3Y7juaBRJj
         nzaxUaN4kV+Me7TbqcQZbrxclOMSamycP+rBUrq/R2r5shk4KtfI8Zw0GUVt7wa0OMF4
         1hHKL5V5l4SmAMu5zxMIW/nC72z7A0Lca6i+oQIRXistBOVabQ3WzqCeOzEFSLbbaNbj
         gmKC257ndbDS3TwT/wU4zUGBuGQbHaU4nAVDXN5D45E8Qyy2BCo0rje7e+lnZtUjSlAg
         +17g==
X-Gm-Message-State: AOJu0Yz97xov+7TR1RxtH8EvXSpt2MS/nkv3NDCRRpNTP7Rr9JO/RJN4
	oktOUPJg/uL24+Q3n76Ny18ezN5rUjnY5WKsCkqIq4hN+5pIr2jt1KX+a0/orl8QAXA=
X-Gm-Gg: Acq92OGn3MwDAvzRpdnl93lKo2AOgfjhECZ8M8atn3VtnqTpyOGSF5VtnB4oJhkw+N1
	4lKwlM80xVSrYXs1KpUcvCq3Wv+mtJt/Ayffx6ms1g826GWzD1T1kro+YZoyVNtz1GZHqwW3FXz
	mZJIyUH7rcrWK30G648oKCQaBjohVQQ29uXnIzWpMcOUSW60N+KXzLlCSpQdJ8ZR0+boj0GinJK
	p/bTqcWJF10QXAsoceGPtQSvXG8rhQubPR7s28kThKCFNLsR7JlvToVXQFO/4vMKsHteLE3old4
	7WN7rnLomFh8zqy3CevnwPyeQQpjvOIz8MEB9Y3J9zFNqRXpUL9RR6Xnfy20KEIwRDHRKu3Rjg2
	Bmtz+iVgYZikvFP4Upp9zjpgaV8LJhe6/XdIA1wUtME3rovDAeaBLrPwWB92W3HGHPh39pnghMB
	VJqfKoSq2RqXlRrpOTFwOMQPHVgdZeu1koTdGRMt3MVs274xmR6G96pNlMY+xqZCDqZoFbN42uI
	e7kEok4uW8Vx5kJQPewrURGvw==
X-Received: by 2002:a05:6000:4b04:b0:449:9aee:4581 with SMTP id ffacd0b85a97d-45eb38b04d0mr40575316f8f.12.1779894966012;
        Wed, 27 May 2026 08:16:06 -0700 (PDT)
Received: from localhost (p200300f65f47db042b54ed4dbf2ca0b5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2b54:ed4d:bf2c:a0b5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45edb5c27e7sm6696549f8f.35.2026.05.27.08.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:16:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] hwmon: cros_ec: Drop unused assignment of platform_device_id driver data
Date: Wed, 27 May 2026 17:15:52 +0200
Message-ID:  <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
References: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=891; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=1sxvn/Utzi477+dohvNbU2G9iyzM3qmfnfrWFkCMItY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFwqrACdlQAViE6QR/zVVUQnBwP8Py6aQJ1mFo ayu6BBpuueJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahcKqwAKCRCPgPtYfRL+ To4MB/4yO22vowyuO83CxmRhhk1KgUCuNz2VwlPKEIh2sVgTBZn2ppk97HWvvjoTEVhqxq3wIDz WwQRAtCP8sKXT7S6ecOMq2qh6AkPqHuCXfaHfnB+BkjKz2SHb3THJTnGDLWRMEKD3FOfacLK3ma I9zXS6R5biP/5I9ktt9h46gc4uoNI/YpgEoHMWtiV+W9tXtflT0UONHOP0etYQCJ8m9ovHwulp9 Cnb6gD+NdMNv90ZwnfQ4fLIKkGCq8RpC1WNWL41fm/MePZX9XAyJ7E3rae0RApV7D0I6x07af+x wjef2b9ESBpOPFJmOyL9Ks6Dj+xLUNXvHMAs6QkjGfciHaIB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignments.

While touching this array unify spacing and use named initializers for
.name.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/hwmon/cros_ec_hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 7c308b0a4b9e..f6cf254395a8 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -654,8 +654,8 @@ static int cros_ec_hwmon_resume(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_hwmon_id[] = {
-	{ DRV_NAME, 0 },
-	{}
+	{ .name = DRV_NAME },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_hwmon_id);
 
-- 
2.47.3

