Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DF243F4D6
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jul 2026 11:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783509419; cv=none; b=cyUgio26fbhNmJBc12/0d63kA2Lmf+fAla/5np6RwEnsxfy2BPHKBuGnAFXH/Nr8WfGR/dp+mCYPZ/6sFSq97z+BwjD1WrNhfjHymN+P8L4sy2whJsFqPLSjZRBLoKvH2r8vQLaK/OePA2cFllb1FJ8jzdbhYnFaoHRCRY1JvmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783509419; c=relaxed/simple;
	bh=qaHMCDQ0wnCBevuvFZFgR8vFowOppWXNbsk1WmPicyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XFWoHckfkHiwrK93J3EMYgTOJkJGnwbXe5vwVNnOc7Kbs/O9fy7SVHB9gVZtEP7cJRuSKzUdQM3yYLwKyO3Bju98oeEPfQnUpeQp45bT7IGWpR2oqIcUKgMPuhHzRDRIgfDVYmpTu1jStwcGwYmwtzE+FfbIbFi5IiRYH2ZH7jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=leJEqLNT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="leJEqLNT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47362928f65so479264f8f.2
        for <chrome-platform@lists.linux.dev>; Wed, 08 Jul 2026 04:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509411; x=1784114211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=leJEqLNTssbPlh1RysatPkfUUsREFZSdQixc2rsPjfhev+6VvIg3fxsLw5TWLjL5ML
         8VgDVUQUHnBfimj0wZirr9nYueXCqDQHLJQGQKPQ31xmO3Fn1JNAmiLEfomq6wVlyu8B
         VBAWaZ9KTbB92NpWTKxKleXS/Yd4GRK92LB31Z/gb31Yz4+eazk1MuOnkJYA71Me7Vx/
         Z/qCklQdUiILITmFGxplq7cu3hUDOWd6AzGcOMYpcUDS2XntYzarEm7q5eg8oC2TZkwd
         qhlmy+zaIwUTT2d9Nuxv02qWvaUmAmOTFlaKBUSXB2ZOwWKCB8ZFvhpx4jMpLe8piL6B
         wQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509411; x=1784114211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftx4kksthHB8P8rF6BFuSI8P+XMB3UDpz0Oz9g7bP1I=;
        b=qRCzRWit+91H2ScC1Asn/ykIgUcjrPwgxfv2pxHb68UBZOdNOE3WctRHiwFnqM6V9P
         DkqnzFdgG1yN/xoXjEUaUfnEeGDhG4jG8QrXPxo4+OCHJ0RbcWV87BxnwPnWI23BC1CS
         ifHIV144K/FAV7f84N/E/tl7hV7CQeuoBYK5rz08CgpiKLjKLVh/sCC+k5SrQW0ir3gs
         HEjFU53mzs6JDvMJZg8kJ5tQnbrPF4BS3PDB3rDh4NdzSbPC5+nE8V3qvuvxMVuj/H07
         IF89KBvUNRZM/EE35My4NpgdXL7wS7bmIJPzAFAT814F+5QRu1Qi9Bk4ZZqSgcpVTqxu
         TbMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJSoqT6oJAMBhgpmOMjOOWBDDI1GNPXJTE9r6DAHq5R3SGFMawRot12LwJfWUXjkq6mxAjIdGdG13XlrWJm0E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2A98SRj7I99bUQDBjeUhLyQQesVK17TgJF2sQBIseE75qLC0z
	FPyTRnsmeRLSUlCmgx0dd6/2jFguiiYQFmsT8iJxan9ueFnXIfOuvm+sSYsvJx+hBHU=
X-Gm-Gg: AfdE7ckA6C1W/VoTDuVzPMwQNkWDnY+K40qxUBbFSOJHVQ4zjBdSH6loVrjVXqM0m72
	dmJBy1jcWh7KZUo3dYSSNJjsjMTdpA8DfVkBUPEgrEZAJVu/sTKLGK9EZNfk+Pv9iUiRmd+3c2a
	eeqwkNMVZL1NIVa3FMojGIfret9wn8tXdDBaCDiCpfFdV2y1v0oUk0uDoJf4DrItPcnw/7CSB5v
	e5LwX2p+2m/QisRoaVTH6r5mp347plMp7XnoFyeMk76K+H13nlL5/8uQhLY9rWHM4ZvvAvakYr+
	1DcYfMRsIKHQaXsyDTvodk2sfgVIX+HQZkNGzaeaqeWhDugh+1zcb99uPPRbqL65x5NbjfZK5xU
	+mCfgtxfotqDTHJjQcgKZpI8J1bJ86gpyYrFlNuGoP+nPN7JBmnOhQdNd0r6o45Ck1Lc2vCPmCM
	GajpVQfOhKhaoDCfprahWYYyHGyXpgXC0N6yJSNfwBq+Cr7hix3cMf8bRvkWQFd/cCf3Xx+nIPz
	c8g
X-Received: by 2002:a05:6000:4a11:b0:473:8f65:c978 with SMTP id ffacd0b85a97d-47df074e23fmr2309041f8f.1.1783509410912;
        Wed, 08 Jul 2026 04:16:50 -0700 (PDT)
Received: from localhost (p200300f65f47db04930dc5bd4534e1e5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:930d:c5bd:4534:e1e5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0960816sm40326700f8f.29.2026.07.08.04.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:16:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/23] mfd: Drop unused assignment of platform_device_id driver data
Date: Wed,  8 Jul 2026 13:15:16 +0200
Message-ID:  <6cdb070a4e773c2c8b84bd2c2dd3628545d7e7bd.1783507945.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qaHMCDQ0wnCBevuvFZFgR8vFowOppWXNbsk1WmPicyU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqTjFUyx0qnP2zKCNNfgNq59gFkbTpytA6eHk24 hmc6ZVxsBiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak4xVAAKCRCPgPtYfRL+ TgqzB/9Bpu/S/yCAfq1ceJH388wa3hj9KYRwwsjLsRZ2wITDPFEIeAGSqN9eX6tfaS/ZeC1rBru RN0YVsdLzykyYbvWGsTFBRNnRWUKRWYeON725oyq3tPzWBgxPb/4M6ab/HM1HCsakAKN2Po/BL1 EMFbC0kr3R5f3F1QSj3tmoN8DesptbklIOW+WuwoGWR/mvnrmOPF1Lun+nBv8x6G3bsEJKflEeh 4h22Y9y8Gh7z5MG/cHlH1eIc2KfK0lwOm9Oyt0iNoQMjKt0AM/hMgHQiRNm0xlMgQGXmNg94cfD VQT2NL17J5x2Q1u4m/nI9EULzqea6htUHzmA0miZsGYP/p00
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The drivers explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop these
unused assignments

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index e253c753beb6..a933cb936da6 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -375,7 +375,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME, 0 },
+	{ DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index ea1d039477e3..7987583afc60 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -429,7 +429,7 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397", 0 },
+	{ "mt6397" },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
-- 
2.55.0.11.g153666a7d9bb

