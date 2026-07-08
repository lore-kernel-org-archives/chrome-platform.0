Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C964657F4
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509429; cv=none; b=bjaBMY8E+DAKnJ2E69h5bOH4yajAry0iVIvsp+xT2/szHV3UUmPieE3jT6f3za6peGgyrdRC1Hwzp6tk29zRgUVa3DgshGmTNOiYc06Hao+VG06Owg7kGHpAJJlFLsyIx5Ee6YlU0kIl2jFloN7BoCGwF7wWWIC7AKBe9RK/SHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509429; c=relaxed/simple;
	bh=Yocslbbh2Ly5jl9ltyhoSfTRYYTxd9v0B/P+M4FNVM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sYZWtU5tjEt0oixcTsuK98ey53nns0v4TjB6SSJ0bSOfjpWR/T8jGrYgjSiaHFuRzJ3JYUkNaX/BaFEHcUXc1jttRNaqT9vfp9VK4uMQgVVDhYXTN4sguOmA2WYYWBqOGZP7wWQ8WhlPByIxS0vSLWR2F/sI+Wbu4hZuAStm+F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=hC13qq5G; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="hC13qq5G"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so4232185e9.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 04:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509425; x=1784114225; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=;
        b=hC13qq5GXXyhMINonLq26+3I8brcrnVzVPdGtCNQxdE6zg08Z4SYgtoQkDWApUkAf2
         vQALZpQEZb33x/w7qTP8i7XWY769Tkbk6tbmxwv0Gmj0pRMBk5Z13vJa2lTI7RDdBdiE
         +kaiVWJYbpx17x3M8O1zQuELVpRF6LRYF6lUTWQ4WUxoPgftVW+tI+wuK1r5Flf4qrQJ
         AWwxp2VriOe+qiWWXgA0lsbdR7sCY2zQjyanjCuAJQ0oHiP2/Jks+r6OPrO8vwg6cYBw
         1rYI/wlxKxP/EkgBV5pzdFc/51h5F1tjnvxN53LT79qO4BkckGUllD1USnsNxyGfWr2q
         5qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509425; x=1784114225;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4cwjDj+7KzBcAXPoTLJ3JC9JSJmT9wQOrir5TeBiIjs=;
        b=elcqlyijYuo8KYIGO2RQ/Xp4EtNRkXcWonJZy89y0+/FZLATDA48SeZBigPmiXJnnd
         gVLgThnKCuXKQ7xDIpsfTbrIIfyjoQrCRE7aUo6/Od6MhP9TqkRRE0x0fPbkDX1shH+q
         vuu2lcBV5ou/LyOgXVeei50PgzxSVAxnKU156l39ORHWcHJD9OmDMfLzxHtKKEsd4sr3
         jsBHTJq16BB19GsBGl4Cia6VfWLGZ7conimpWskHluRVfPiOF4X8ip7Qnti10s2xruxi
         WDJFcOuNds8DHPcfHlDzKstHFbb/e0fIdW9hzZkd38X0xs5O4IkoS70A7a2YTdWCBRl/
         7xZQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9Y6xSoa/y32tUplETaflDAYXtGp1mdvph5b/wvPDtwOL0MctSM+HcT6fpnC+QNwl6Pm2RBb6F7NI5Tu5wulk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxD/UWAz1Espkp9rDkJemisl+uk1IU80ftFjv4yulJ3tIyYN4Ck
	d0OmntZblcG2nUxbGUvPSKyyipJcyoKu2EoE+nOLzHbJfxbuH7ZmVDGPkx1s4phR7kE=
X-Gm-Gg: AfdE7cnPIOgemYIVizf76UIvF63nniMvYjQwd6wpAwHKU148qGrjh0IrNmfxbwi3wKX
	SU5c7H74mJYZtapr9GDxczOVTQ80wrcX7r8YGPOh4yyTWo7UR/MZ6DjEr9u1OZQK/XMYQNKObQ/
	zQZ4ocBoTh6O752fJoE8NWSeLmobCBQ5VKPIKl9PxHzaBYOP3LLK5atM50T6647MqHe+vxANJ5w
	PbX1HPAcKmJAe24B0LZxZPW2trEDwohvkdcKfSXEq47MN8AFwq+SVUxMOorS/NVVA7lAbFRwkiL
	pfhy6oSiHYoYtRiGf8ICd12Q+RUu316RKwAc5iRMld+5r0XrLak4X+PN0tcdz5u11FXCFoHdVNV
	bdX5SEu54XIdjiKhIZiaXRC/5/VgPxLiWzI82XYeqq0kr/8BBCVT9d+qjD5cyeNbWFXYDFGeC2E
	njoVwvq/0vCIUIBCe9hkmFndJkKhD8JecpYyE7tZbDQbTn76zpRmIYkozUzNrBedZ6Wz9cQ2pgR
	nw8JdQxJLj77us=
X-Received: by 2002:a05:600c:8b2b:b0:493:e79e:da6b with SMTP id 5b1f17b1804b1-493e79edb81mr14329665e9.21.1783509424549;
        Wed, 08 Jul 2026 04:17:04 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e0fbb410sm134582585e9.12.2026.07.08.04.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:04 -0700 (PDT)
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
Subject: [PATCH v2 16/23] mfd: Use named initializers for platform_device_id array
Date: Wed,  8 Jul 2026 13:15:23 +0200
Message-ID:  <1bc763b0de24d50e83972b5f0dd31ae52dc558b0.1783507945.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Yocslbbh2Ly5jl9ltyhoSfTRYYTxd9v0B/P+M4FNVM8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFzyT0ZErsr2QqgUI+ds7aThxCts2E7ekkXL BACi/D+1X2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xcwAKCRCPgPtYfRL+ TvLFB/9hN+VB2+hmD5mjaItFVbgfdSMKak8oAIsjfT3yy5d+i61CICxL9i+805fBO8WayHEw0J4 WWVSFrgdv9eWp60pkSg/voFbzW8yf6/lYZDDMlbiZzrL2qi/A717lcyifJT1aDB1ZCLuO6rijK2 SCC1e2pwmS5uh5lZAvOogmiDKp2ywDkbkQfcJNRk2cAAJ1ECRb0tcmjBh8fKG72bGDEenli4yN7 OMDXv0I3ISleKF6I+avOCcNIZXa+ycqDnLzR14Igy5ifsu6sIQhY0TmY/RdOe0hlDal6+N8d1nl wGO8Wq1G3/uz/qGLVcyHKpv9whEa/ciwhBlEHY3Jii5OmZ1h
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

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++----
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index f0bc0b5a6f4a..7c00c71ca4ba 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1250,10 +1250,10 @@ static int ab8500_probe(struct platform_device *pdev)
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
index a933cb936da6..baa6487abf9e 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME },
+	{ .name = DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 7987583afc60..7bbd9b730b75 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -429,8 +429,8 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397" },
-	{ },
+	{ .name = "mt6397" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
 
-- 
2.55.0.11.g153666a7d9bb

